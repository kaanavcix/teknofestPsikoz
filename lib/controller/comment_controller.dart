import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:psikoz/product/base/IDioService2.dart';

import '../product/service/model/comment/comment_model.dart';
import '../product/service/service/dio_service_db.dart';

class CommentController extends GetxController {
  CommentModel? commentModel;
  late IDioServiceMain dioService;

  Future<void> getComments(int id) async {
    commentModel = await dioService.getComments(id);
    print(commentModel);
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dioService = DioServiceDb(
        Dio(BaseOptions(baseUrl: "http://192.168.192.1:8080/api/")));
  }
}
