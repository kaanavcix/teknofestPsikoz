import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/service/firebase/firebase_db.dart';
import 'package:psikoz/core/service/model/user_model.dart';

import 'package:psikoz/controller/profile_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../core/service/model/post/post_model_output.dart';

class HomeController extends GetxService {
  late final dateTime;
  UserInfos? personInfo;
  late final String formatter;
  FirebaseDb db = FirebaseDb();
  var frontText = "Günaydın".obs;
  var isClicked = false.obs;
  var isSizedBox = false.obs;
  RefreshController refreshController = RefreshController();

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();

    dateTime = DateTime.now();
    formatter = DateFormat.H().format(dateTime);
    datetimeSelected();
  }

  datetimeSelected() {
    int time = int.parse(formatter);

    if (0 < time && time <= 5) frontText.value = "İyi Uykular";
    if (6 < time && time <= 12) frontText.value = "Günaydın";
    if (13 < time && time <= 18) frontText.value = "İyi Günler";
    if (19 < time && time <= 24) frontText.value = "İyi Akşamlar";
  }

  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }

  String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('HH:mm a');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = '${diff.inDays} DAY AGO';
      } else {
        time = '${diff.inDays} DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = '${(diff.inDays / 7).floor()} WEEK AGO';
      } else {
        time = '${(diff.inDays / 7).floor()} WEEKS AGO';
      }
    }

    return time;
  }

  usernameDetection(PostOutput data, FirebaseDb db) {
    if (int.parse(db.user.first.claimsId ?? "1") >= 3) {
      return data.username ?? "";
    } else if (int.parse(db.user.first.claimsId ?? "1") <= 3) {
      return data.isAnonim ?? true ? data.anonimname : data.username;
    } else {
      return data.anonimname;
    }
  }

  Future<void>? setEmotions(String emotion) async {
    isClicked.toggle();
    await db.setEmotion(emotion);
    isSizedBox.toggle();
    await Future.delayed(const Duration(seconds: 3));
  }

  Future<void> onrefresh() async {
    await Future.delayed(Duration(seconds: 1));
    refreshController.refreshCompleted();
  }
}
