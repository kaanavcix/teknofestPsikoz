class UserForLoginModel {
  String? password;
  String? email;

  UserForLoginModel({this.password, this.email});

  UserForLoginModel.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['password'] = password;
    data['email'] = email;
    return data;
  }
}
