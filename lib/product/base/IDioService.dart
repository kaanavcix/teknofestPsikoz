import 'package:dio/dio.dart';
import 'package:psikoz/product/service/model/tokens/token_model.dart';
import 'package:psikoz/product/service/model/result/result_model.dart';

import '../service/model/onborading/login_model.dart';
import '../service/model/onborading/register_model.dart';

abstract class IDioService {
  final Dio dio;

  IDioService(this.dio);

  Future<BaseModel?> login(LoginModel model);
  Future<BaseModel?> register(RegisterModel model);
}
