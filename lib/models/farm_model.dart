class FarmModel {
  String farmName;
  String location;
  String farmType;
  String sizeInAcres;
  String crop;
  String userId;

  FarmModel({
    required this.farmName,
    required this.location,
    required this.farmType,
    required this.sizeInAcres,
    required this.crop,
    required this.userId,
  });


  FarmModel.fromJson(Map<String , dynamic>json):this(
    farmName: json['farmName'],
    location: json['location'],
    farmType: json['farmType'],
    sizeInAcres: json['sizeInAcres'],
    crop: json['crop'],
    userId: json['userId'],

  );


  Map<String, dynamic> toJson() {
    return {
      'farmName': farmName,
      'location': location,
      'farmType': farmType,
      'sizeInAcres': sizeInAcres,
      'crop': crop,
      'userId': userId,
    };
  }
}