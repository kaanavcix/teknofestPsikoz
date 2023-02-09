import 'package:hive/hive.dart';
part 'user_cache_model.g.dart';

@HiveType(typeId: 1)
class UserCacheModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? username;
  @HiveField(3)
  bool? isPatient;
  @HiveField(4)
  int? age;
  @HiveField(5)
  int? gender;
}
