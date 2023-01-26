import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:psikoz/controller/profile_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:psikoz/product/base/IDioService2.dart';
import 'package:psikoz/product/service/model/material/article_model.dart';
import 'package:psikoz/product/service/model/material/book_model.dart';
import 'package:psikoz/product/service/model/material/music_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  late final dateTime;
  late final String formatter;
  var frontText = "Günaydın".obs;
  var isClicked = false.obs;
  var isSizedBox = false.obs;
  RefreshController refreshController = RefreshController();
  final box = GetStorage("token");
  IDioServiceMain dioService;
  MusicModel? musicModel;
  BookModel? bookModel;
  ArticleModel? articleModel;
  var isLoading = false.obs;
  ScrollController controllers = ScrollController();

  HomeController({required this.dioService});

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    
    initService();
   
    dateTime = DateTime.now();
    formatter = DateFormat.H().format(dateTime);
    datetimeSelected();
  }

  datetimeSelected() {
    int time = int.parse(formatter);

    if (0 < time && time <= 5) frontText.value = "İyi Uykular";
    if (6 < time && time <= 12) frontText.value = "Günaydın";
    if (13 < time && time <= 18) frontText.value = "İyi Günler";
    if (19 < time && time <= 24) frontText.value = "İyi Akşamlar";
  }

  Future<void> signout() async {
    await box.remove("auth");
  }

  Future<void>? setEmotions(String emotion) async {
    isClicked.toggle();
    await Future.delayed(const Duration(seconds: 3));
    isSizedBox.toggle();
    await Future.delayed(const Duration(seconds: 3));
  }

  Future<void> onrefresh() async {
    initService();
    refreshController.refreshCompleted();
     controllers.jumpTo(0);

  }

  Future<void> initService() async {
    isLoading.toggle();
    musicModel = await dioService.getMusics();
    bookModel = await dioService.getBooks();
    articleModel = await dioService.getArticles();
    isLoading.toggle();
    update();
  }

 
}
