import 'package:dio/dio.dart';


import '../../base/IDioService.dart';
import '../model/tokens/token_model.dart';
import '../model/onborading/login_model.dart';
import '../model/onborading/register_model.dart';
import '../model/result/result_model.dart';


class DioServiceOnboard extends IDioService{
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
        return ErrorModel.fromJson(data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
  }

  @override
  Future<BaseModel?> register(RegisterModel model) async {
   try {
      var response = await dio.post(OnboardPath.register.name, data: model.toJson());

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
}


enum OnboardPath{
  login,register

}