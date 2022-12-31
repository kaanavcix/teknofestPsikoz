import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:painter/painter.dart';

class DrawController extends GetxController {
   PainterController controller = paint();
  bool isFinished = false;
  static PainterController paint() {
    PainterController controller = PainterController();
    controller.backgroundColor = Colors.white;
    controller.thickness = 4.0;
    return controller;
  }

  void changeOn (double value) {
    controller.thickness = value;
  }
}
