import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:psikoz/product/controller/main_controller.dart';
import 'package:psikoz/product/controller/profile_controller.dart';
import 'package:image_picker/image_picker.dart';

class PostController extends GetxController
    with GetSingleTickerProviderStateMixin {
  MainController maincontroller = Get.find<MainController>();
  
  TextEditingController postEditinController = TextEditingController();

  Rx<XFile?> selectedImage = Rx<XFile?>(null);
  List<File?> photoList = [];
  var clickButton = false.obs;

  late final AnimationController animate = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );

  late final Animation<double> animation = CurvedAnimation(
    parent: animate,
    curve: Curves.ease,
  );

  Future<void> createPostControl(
      String? text, List<File?> pickedFileList) async {
   
  }

  Future<XFile?> getPickedImage(
    ImageSource imageSource,
  ) async {
    final ImagePicker imagePicker = ImagePicker();

    final XFile? image = await imagePicker.pickImage(source: imageSource);
    if (image != null) {
      selectedImage.value = image;
      return image;
    }
  }

  Future<List<File?>?> getPickedImageList(
    ImageSource imageSource,
  ) async {
    final ImagePicker imagePicker = ImagePicker();

    final List<XFile>? image = await imagePicker.pickMultiImage();
    if (image != null) {
      image.forEach((element) {
        photoList.add(File(element.path));
      });
      return photoList;
    }
  }
}
