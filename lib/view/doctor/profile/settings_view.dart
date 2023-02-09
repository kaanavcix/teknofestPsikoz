import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psikoz/core/components/iconWidget/leading_widget.dart';

class SettingViewDoctor extends StatelessWidget {
  const SettingViewDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ayarlar"),
        leading: LeadingWidget(),
      ),
      body: Column(children: [
        ListTile(
          title: Text("Çıkış yap"),
          onTap: () async {
            final box = GetStorage("token");

            await box.remove("auth").then((value) {
              Get.offAndToNamed("/");
            });
          },
        )
      ]),
    );
  }
}
