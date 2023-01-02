import 'package:dio/dio.dart';

import 'package:psikoz/product/service/model/user/user_model.dart';

abstract class IDioServiceUser {
  Dio dio;
  IDioServiceUser(
     this.dio,
  );
  Future<UserModel> getUserData(TokenInputModel tokenInputModel);
  
}
