import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psikoz/core/service/model/OnboardingModel/UserForRegister.dart';
import 'package:psikoz/core/service/model/user_model.dart';
import '../model/OnboardingModel/UserForLoginModel.dart';
import 'package:rxdart/rxdart.dart';

class FireBaseServiceAuth {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
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
      "Description":""
    });
    db
        .collection("UserOperationClaims")
        .doc(userCredential.user?.uid)
        .set({"Uid": userCredential.user!.uid, "ClaimsId": "1"});
  }

  Future<void> signInWithEmail(UserForLoginModel userForLoginModel) async {
    
    
        await firebaseAuth.signInWithEmailAndPassword(
            email: userForLoginModel.email ?? "",
            password: userForLoginModel.password ?? "");

  }
}
