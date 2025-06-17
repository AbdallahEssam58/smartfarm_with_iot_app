import 'dart:convert';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTService {
  static final MQTTService _instance = MQTTService._internal();
  factory MQTTService() => _instance;
  MQTTService._internal();

  late MqttServerClient client;
  Function(Map<String, dynamic>)? onMessageCallback;

  Future<void> connect() async {
    client = MqttServerClient(
      '0c4dff9ab91f48c3a3f19473d65449bf.s1.eu.hivemq.cloud',
      'flutter_client',
    );

    client.port = 8883;
    client.keepAlivePeriod = 20;
    client.logging(on: true);
    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;
    client.secure = true;
    client.setProtocolV311();

    final connMess = MqttConnectMessage()
        .withClientIdentifier('flutter_client')
        .authenticateAs('Rehab_shehta', '2242003Rehab#')
        .startClean();

    client.connectionMessage = connMess;

    try {
      await client.connect();
      print('✅ MQTT Connected!');
      client.subscribe('ai/response', MqttQos.atLeastOnce);
      client.updates!.listen(_onMessage);
    } catch (e) {
      print('❌ MQTT Connection Failed: $e');
      client.disconnect();
    }
  }

  void _onMessage(List<MqttReceivedMessage<MqttMessage>> event) {
    final recMess = event[0].payload as MqttPublishMessage;
    final payload =
    MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

    try {
      final data = jsonDecode(payload);
      print('📩 MQTT Message Received: $data');
      if (onMessageCallback != null) {
        onMessageCallback!(data);
      }
    } catch (e) {
      print('❌ JSON Parse Error: $e');
    }
  }

  void onDisconnected() {
    print('⚠️ Disconnected from MQTT Broker');
  }

  void onConnected() {
    print('✅ Connected to MQTT Broker');
  }

  void setOnMessage(Function(Map<String, dynamic>) callback) {
    onMessageCallback = callback;
  }
}