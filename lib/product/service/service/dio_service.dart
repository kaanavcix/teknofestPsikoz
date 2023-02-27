import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;

import '../../base/IDioService.dart';
import '../model/tokens/token_model.dart';
import '../model/onborading/login_model.dart';
import '../model/onborading/register_model.dart';
import '../model/result/result_model.dart';

class DioServiceOnboard extends IDioService {
  DioServiceOnboard(super.dio);

  @override
  Future<BaseModel?> login(LoginModel model) async {
    try {
      var response = await dio.post(OnboardPath.login.name, data: model);

      if (response.statusCode == 200) {
        var data = response.data;
        if (response.data is Map<String, dynamic>) {
          return TokenModel.fromJson(data);
        }
      } else if (response.statusCode == 404) {
        var data = response.data;
         Get.snackbar("Error", data.toString());
        return ErrorModel.fromJson(data);
        
      }
    } on DioError catch (e) {
      Get.snackbar("Hi", e.message.toString());
    }
  }

  @override
  Future<BaseModel?> register(RegisterModel model) async {
    try {
      var response =
          await dio.post(OnboardPath.register.name, data: model.toJson());

      if (response.statusCode == 200) {
        var data = response.data;
        if (response.data is Map<String, dynamic>) {
          return TokenModel.fromJson(data);
        }
      } else if (response.statusCode == 404) {
        var data = response.data;
        return ErrorModel.fromJson(data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
  }

  @override
  Future<BaseModel?> usernameDetection(String username) async {
    try {
      var response = await dio.post("${OnboardPath.user.name}/$username");

      if (response.statusCode == 200) {
        var data = response.data;

        if (data is Map<String, dynamic>) {
          return SuccessModel.fromJson(data);
        }
      }
      if (response.statusCode == 201) {
        return ErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      Map<String, dynamic> result = {"sucess": false, "message": e.message};
      print(e.message);
      return ErrorModel.fromJson(result);
    }
  }

  @override
  Future<BaseModel?> registerDoctor(FormData model) async {
    try {
      var response = await dio.post(OnboardPath.register.name, data: model);
      print(response.data);
      if (response.statusCode == 200) {
        var data = response.data;
        if (response.data is Map<String, dynamic>) {
          return TokenModel.fromJson(data);
        }
      } else if (response.statusCode == 400) {
        var data = response.data;
        return ErrorModel.fromJson(data);
      }
    } on DioError catch (e) {
      print(e.message);
      print(e.error);
    }
  }
}

enum OnboardPath {
  login,
  register,
  user,
}
