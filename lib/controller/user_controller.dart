import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psikoz/product/base/IDioservice_user.dart';
import 'package:psikoz/product/service/model/user/user_model.dart';

class UserController extends GetxController {
  UserModel? userModel;
  IDioServiceUser dioServiceUser;
  var isLoading = false.obs;
  var box;
  var token;

  UserController(this.dioServiceUser);
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    box = GetStorage("token");
    token = box.read("auth");
    await getUserData();
  }

  Future getUserData() async {
    isLoading.toggle();
    userModel = await dioServiceUser.getUserData(TokenInputModel(token: token));
  isLoading.toggle();
  
    update();
  }
}
