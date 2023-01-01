import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertView extends StatelessWidget {
  const AlertView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Bildirimler",
        style: Get.textTheme.bodyMedium,
      )),
    );
  }
}
