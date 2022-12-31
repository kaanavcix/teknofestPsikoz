import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainViewDoctor extends StatelessWidget {
  const MainViewDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text("doctor page"),
          TextButton(
              onPressed: () async {
                final box = GetStorage("token");

                await box.remove("auth").then((value) {
                  Get.offAndToNamed("/");
                });
              },
              child: Text("Çıkış yap",style: Get.textTheme.bodyMedium,))
        ],
      )),
    );
  }
}
