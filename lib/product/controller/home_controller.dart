import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/service/firebase/firebase_db.dart';
import 'package:psikoz/core/service/model/user_model.dart';

import 'package:psikoz/product/controller/profile_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxService {
  late final dateTime;
  UserInfos? personInfo ;
  late final String formatter;
  FirebaseDb db = FirebaseDb();
  var frontText = "Günaydın".obs;

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
}
