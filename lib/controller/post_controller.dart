import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:psikoz/product/base/IDioService2.dart';
import 'package:psikoz/product/service/model/post/post_model_input.dart';
import 'package:psikoz/controller/main_controller.dart';
import 'package:psikoz/controller/profile_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:psikoz/product/service/model/post/post_model_output.dart';

class PostController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PostController(this.dioService);
  MainController maincontroller = Get.find<MainController>();
  late AnimationController switchAnimation;
  TextEditingController postEditinController = TextEditingController();
  IDioServiceMain dioService;
  Rx<XFile?> selectedImage = Rx<XFile?>(null);
  List<File?> photoList = [];
  var clickButton = false.obs;
  var switchClick1 = false.obs;
  var switchClick2 = false.obs;
  var switchClick3 = true.obs;
  var isLoading = false.obs;
  PostModel? postModel;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    switchAnimation = AnimationController(
        vsync: this,
        value: switchClick3.isTrue ? 0.5 : 1,
        duration: const Duration(seconds: 1));
    getPosts();
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

  Future<Object?> addPost() async {
    return await dioService
        .add(PostInputModel(userId: 3, content: postEditinController.text));
  }

  Future<void> getPosts() async {
    isLoading.toggle();
    postModel = await dioService.getAll();
    isLoading.toggle();
    update();
  }
}
