import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import '../model/user_model.dart';

class FirebaseDb extends GetxService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  RxList<UserInfos> user = RxList<UserInfos>([]);

  Stream<List<UserInfos>> getInfos() async* {
    var refCliams = await getClaims();
    var data = db
        .collection("Users")
        .where("Uid", isEqualTo: firebaseAuth.currentUser?.uid)
        .snapshots();

    var dataEnd = data.map((event) => event.docs.map((e) {
          var userData =
              UserInfos.fromFirestore(e, null, refCliams[1], refCliams[0]);
          print(userData);
          return userData;
        }).toList());

    yield* dataEnd;
  }

  Future<List<String>> getClaims() async {
    var claimsId;
    var claimsName;
    await db
        .collection("UserOperationClaims")
        .doc(firebaseAuth.currentUser?.uid)
        .get()
        .then((DocumentSnapshot doc) => claimsId = doc["ClaimsId"]);
    await db
        .collection("OperationClaims")
        .doc(claimsId)
        .get()
        .then((doc) => claimsName = doc["ClaimsName"]);

    return [claimsId, claimsName];
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    user.bindStream(getInfos());
  }
}
