import 'package:dio/dio.dart';
import 'package:psikoz/product/base/IDioservice_user.dart';
import 'package:psikoz/product/service/model/user/user_model.dart';

class DioServiceUser extends IDioServiceUser {
  DioServiceUser(super.dio);

  @override
  Future<UserModel> getUserData(TokenInputModel tokenInputModel) async {
    try {
      var response = await dio.post(UserPath.user.name, data: tokenInputModel);

      if (response.statusCode == 200) {
        var data = response.data;

        if (data is Map<String, dynamic>) {
          return UserModel.fromJson(data);
        }
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return UserModel();
  }
}

enum UserPath { user }
