import 'package:flutter/material.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/init/theme/text_theme.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/service/firebase/firebase_db.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/product/controller/profile_controller.dart';
import 'package:psikoz/view/profile/anonim_name_view.dart';

class SettingsView extends GetView<FirebaseDb> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: IconNames.arrowleft
                .tosvgPictureConvert(Colors.white, width: 24, height: 24)),
        title: Text("Ayarlar", style: grText.copyWith(color: Colors.white)),
      ),
      body: ListView(children: [
        ListTile(
          onTap: () => Get.to(()=>const AnonimNameView()),
          leading: IconNames.profile
              .tosvgPictureConvert(EmbabedUtility.socialLightGray),
          title: Text(
            "Anonim isim ",
            style: grText.copyWith(color: Colors.white),
          ),
          subtitle: controller.user.first.anonimName == ""
              ? Text("Bir anonim isime sahip değilsiniz.")
              : Text(" Şu an ki anonim isminiz : ${controller.user.first.anonimName} eğer değiştirmek isterseniz tıklayınız"),
        ),ListTile(
          //onTap: () =>controller.signout(),
          
          title: Text(
            "Cıkıs",
            style: grText.copyWith(color: Colors.white),
          ),
          
        )
      ]),
    );
  }
}
