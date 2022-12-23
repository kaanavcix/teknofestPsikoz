import 'package:hive/hive.dart';

import '../../service/model/Tokens/token_model.dart';

class HiveCache {
  static Future<void> saveTokenLocal(TokenModel tokenModel) async {
    var box = Hive.box(HivePath.token.name);

    await box.put(HivePath.tokenAuth.name, tokenModel.token);
  }

}

enum HivePath { token, tokenAuth }
