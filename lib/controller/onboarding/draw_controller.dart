import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:painter/painter.dart';

class DrawController extends GetxController {
  PainterController controller = paint();
  bool isFinished = false;
  Rx<Uint8List> photo = Rx<Uint8List>(Uint8List(2));
  static PainterController paint() {
    PainterController controller = PainterController();
    controller.backgroundColor = Colors.white;
    controller.thickness = 4.0;
    return controller;
  }

  var thickness = 4.0.obs;
  var isLoading = false.obs;
  var isChange = true.obs;
  var pickerColor = Colors.black.obs;
  var finished = false.obs;

  void loadingBar() {
    isLoading.toggle();
    update();
  }

  void onchange(double value) {
    thickness.value = value;
    controller.thickness = value;
  }

  void onPress() {
    isChange.toggle();
    controller.eraseMode = !controller.eraseMode;
    update();
  }

  void onColorChange(Color color) {
    pickerColor.value = color;

    update();
  }

  void colorDetection(bool isBackground, Color color) {
    if (isBackground) {
      controller.backgroundColor = pickerColor.value;
    } else {
      controller.drawColor = pickerColor.value;
    }
  }

  Future<void> setPhoto(Future<Uint8List> picture) async {
    photo.value = await picture;
    update();
  }
}
