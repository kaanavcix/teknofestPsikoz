import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psikoz/product/base/IDioService2.dart';
import 'package:psikoz/product/service/model/post/post_model_output.dart';
import 'package:psikoz/product/service/model/result/result_model.dart';
import 'package:psikoz/product/service/model/user/user_model.dart';

class GeneralControlController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController generalControl;
  IDioServiceMain dioService;
  BaseModel? postModel;
  GeneralControlController(this.dioService);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    generalControl = TabController(
      vsync: this,
      length: 3,
    );
    getCustomPosts();
  }

  getCustomPosts() async {
    var box = await GetStorage("token");
    var data = box.read("auth");

    postModel = await dioService.getmypost(TokenInputModel(token: data));
  }
}
