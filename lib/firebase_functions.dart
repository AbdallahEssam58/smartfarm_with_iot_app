import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'models/farm_model.dart';
import 'models/user_model.dart';

class FirebaseFunctions {
  static Future<void> addFarm(FarmModel farmModel) async {
    await FirebaseFirestore.instance
        .collection('Farms')
        .add(farmModel.toJson());
  }

  static Future<List<FarmModel>> getFarmsForUser(String userId) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Farms')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs
        .map((doc) => FarmModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  static Future<void> updateFarm(String docId, FarmModel updatedFarm) async {
    await FirebaseFirestore.instance
        .collection('Farms')
        .doc(docId)
        .update(updatedFarm.toJson());
  }

  static Future<void> deleteFarm(String docId) async {
    await FirebaseFirestore.instance.collection('Farms').doc(docId).delete();
  }

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (User, _) {
        return User.toJson();
      },
    );
  }


  static Future<UserModel?> readUser()async{
    DocumentSnapshot<UserModel> docRef=await getUsersCollection().doc(FirebaseAuth.instance.currentUser!.uid).get();
    return docRef.data();
  }

  static Future<void> addUser(UserModel userModel) {
    var collection = getUsersCollection();
    var docRof = collection.doc(userModel.id);
    return docRof.set(userModel);
  }


  static loginUser(String emailAddress, String password,
      {required Function onSuccess, required Function onError}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      onSuccess(credential.user?.displayName ?? "");
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    } catch (e) {
      onError(e.toString());
    }
  }

  static createAccountAuth(String emailAddress, String password,
      {required Function onSuccess,
        required Function onError,
        required String firstName,
        required String lastName}) async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      await credential.user?.sendEmailVerification();
      UserModel userModel = UserModel(
          id: credential.user!.uid,
          email: emailAddress,
          firstName: firstName,
          lastName: lastName);
      addUser(userModel);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    } catch (e) {
      onError(e.toString());
    }
  }
}
