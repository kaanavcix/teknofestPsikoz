import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psikoz/core/base/firebase_auth_base.dart';
import 'package:psikoz/core/service/model/OnboardingModel/UserForRegister.dart';
import 'package:psikoz/core/service/model/user_model.dart';
import '../model/OnboardingModel/UserForLoginModel.dart';
import 'package:rxdart/rxdart.dart';

class FireBaseServiceAuth extends IFirebaseAuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<void> signUpWithEmail(UserForRegister userForRegister) async {
    UserCredential userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
            email: userForRegister.email.toString(),
            password: userForRegister.password.toString());

    db.collection("Users").doc(userCredential.user?.uid).set({
      "Username": userForRegister.userName,
      "Email": userForRegister.email,
      "FirstName": userForRegister.firstName,
      "Image": " ",
      "Follow": [],
      "Uid": userCredential.user!.uid,
      "ClaimsId": "1",
      "Following": [],
      "AnonimName": "",
      "BackgroundImage": "",
      "Description": ""
    });
    db
        .collection("UserOperationClaims")
        .doc(userCredential.user?.uid)
        .set({"Uid": userCredential.user!.uid, "ClaimsId": "1"});
  }

  @override
  Future<void> signInWithEmail(UserForLoginModel userForLoginModel) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: userForLoginModel.email ?? "",
        password: userForLoginModel.password ?? "");
  }

  @override
  Future<void> signOut() async {
    return await firebaseAuth.signOut();
  }

  @override
  Future<bool> existUsername(String username) async {
    var data = await db
        .collection("Users")
        .where("Username", isEqualTo: username)
        .get();

    if (data.size == 0) {
      return false;
    } else {
      return true;
    }
  
  }
}
