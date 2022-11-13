import 'package:hive/hive.dart';
import 'package:psikoz/core/service/model/Tokens/TokenModel.dart';

class HiveCache {
  HiveCache();
  Future<void> saveTokenLogin(TokenModel tokenModel) async {
    var box = Hive.box(HivePath.token.name);

    await box.put(HivePath.tokenAuth.name, tokenModel.data?.token);
  }

  Future<void> saveTokenRegister(TokenModel tokenModel) async {
    var box = Hive.box(HivePath.token.name);

    await box.put(HivePath.tokenAuth.name, tokenModel.data?.token);
  }
}

enum HivePath { token, tokenAuth }
