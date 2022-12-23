/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:psikoz/product/service/model/post/post_model_input.dart';
import 'package:psikoz/product/service/model/post/post_model_output.dart';
import 'package:rxdart/rxdart.dart';
import '../model/user_model.dart';
import 'package:uuid/uuid.dart';

class FirebaseDb extends GetxService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  RxList<UserInfos> user = RxList<UserInfos>([]);
  RxList<PostOutput> post = RxList<PostOutput>([]);

  Stream<List<UserInfos>> getInfos() async* {
    var refCliams = await getClaims();
    var data = db
        .collection("Users")
        .where("Uid", isEqualTo: firebaseAuth.currentUser?.uid)
        .snapshots();

    var dataEnd = data.map((event) => event.docs.map((e) {
          var userData =
              UserInfos.fromFirestore(e, null, refCliams[1], refCliams[0]);
          print(userData.anonimName);
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
        .then((doc) => claimsId = doc["ClaimsId"]);
    await db
        .collection("OperationClaims")
        .doc(claimsId)
        .get()
        .then((doc) => claimsName = doc["ClaimsName"]);

    return [claimsId, claimsName];
  }

  Future<void> addPost(PostModelForInput postModelForInput) async {
    var doc = const Uuid().v4();

    var model = PostModelForInput(
            categroryName: postModelForInput.categroryName,
            createdTime: postModelForInput.createdTime,
            anonimname: postModelForInput.anonimname,
            id: doc,
            age: postModelForInput.age,
            gender: postModelForInput.gender,
            isAnonim: postModelForInput.isAnonim,
            isCommentBloc: postModelForInput.isCommentBloc,
            isLikeBloc: postModelForInput.isCommentBloc,
            likes: postModelForInput.likes,
            message: postModelForInput.message,
            saves: postModelForInput.saves,
            userId: postModelForInput.userId,
            username: postModelForInput.username)
        .toJson();
    db.collection("Posts").doc(doc).set(model);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    post.bindStream(getPost());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    user.bindStream(getInfos());
  }

  Stream<List<PostOutput>> getPost() {
    return db
        .collection("Posts")
        .snapshots()
        .map((event) => event.docs.map((e) {
              print(e.data());
              return PostOutput.fromFirestore(e, null);
            }).toList());
  }

  Future<void> setEmotion(String emotion) {
    return db.collection("emotion").doc(firebaseAuth.currentUser?.uid).set({
      "Uid": firebaseAuth.currentUser?.uid,
      "currenState": emotion,
      "Timestap": Timestamp.now()
    });
  }
}
 */