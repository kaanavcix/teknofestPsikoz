import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/service/firebase/firebase_db.dart';
import 'package:psikoz/core/service/model/post/post_model_input.dart';
import 'package:psikoz/controller/main_controller.dart';
import 'package:psikoz/controller/profile_controller.dart';
import 'package:image_picker/image_picker.dart';

class PostController extends GetxController
    with GetSingleTickerProviderStateMixin {
  MainController maincontroller = Get.find<MainController>();
  late AnimationController switchAnimation;
  TextEditingController postEditinController = TextEditingController();

  Rx<XFile?> selectedImage = Rx<XFile?>(null);
  List<File?> photoList = [];
  var clickButton = false.obs;
  var switchClick1 = false.obs;
  var switchClick2 = false.obs;
  var switchClick3 = true.obs;
  var db = Get.find<FirebaseDb>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    switchAnimation = AnimationController(
        vsync: this,
        value: switchClick3.isTrue ? 0.5 : 1,
        duration: const Duration(seconds: 1));
  }

  late final AnimationController animate = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );

  late final Animation<double> animation = CurvedAnimation(
    parent: animate,
    curve: Curves.ease,
  );

  Future<void> createPostControl(
      String? text, List<File?> pickedFileList) async {}

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

  bool? onChanged(bool value) {
    switchClick1.value = value;
    update();
    return null;
  }

  bool? onChanged1(bool value) {
    switchClick2.value = value;
    update();
    return null;
  }

  bool? onChanged2(bool value) {
    switchClick3.value = value;
    update();
    return null;
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

  Future<void> createPost() {
    return db.addPost(PostModelForInput(
      anonimname: db.user.first.anonimName,
      categroryName: "",
      age: "12",
      gender: true,
      isAnonim: switchClick3.value,
      username: db.user.first.username,
      isCommentBloc: switchClick1.value,
      isLikeBloc: switchClick2.value,
      likes: [],
      message: postEditinController.text,
      saves: [],
      userId: db.user.first.uid,
      createdTime: Timestamp.now(),
      id: "",

    ));
  }
}
