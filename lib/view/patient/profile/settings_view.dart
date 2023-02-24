import 'package:flutter/material.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/controller/profile_controller.dart';
import 'anonim_name_view.dart';

class SettingsView extends GetView<ProfileController> {
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
                .tosvgPictureConvert(null, width: 24, height: 24)),
        title: Text("Ayarlar"),
      ),
      body: ListView(children: [
        ListTile(
          onTap: () => Get.to(() => const AnonimNameView()),
          leading: IconNames.profile
              .tosvgPictureConvert(EmbabedUtility.socialLightGray),
          title: Text(
            "Anonim isim ",
           
          ),
          subtitle: "" == ""
              ? Text(
                  "Bir anonim isime sahip değilsiniz.",
                 
                )
              : Text(
                  " Şu an ki anonim isminiz :  eğer değiştirmek isterseniz tıklayınız",
                 ),
        ),
        ListTile(
          onTap: ()=> controller.signout(),
          title: Text(
            "Çıkış yap",
            style: Get.textTheme.bodyMedium,
          ),
        )
      ]),
    );
  }
}
