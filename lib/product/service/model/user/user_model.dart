class UserModel {
  bool? success;
  Data? data;

  UserModel({this.success, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  String? name;
  String? username;
  bool? isPatient;
  int? age;
  int? gender;
  String?description;

  Data(
      {this.id,
      this.name,
      this.username,
      this.isPatient,
      this.age,
      this.gender,this.description});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    isPatient = json['is_patient'];
    age = json['age'];
    gender = json['gender'];
    description = json['description'];
  }
}

class TokenInputModel {
  String? token;

  TokenInputModel({this.token});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['token'] = token;
    return data;
  }
}
