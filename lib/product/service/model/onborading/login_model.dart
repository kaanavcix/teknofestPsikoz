class LoginModel {
  String? password;
  String? email;

  LoginModel({this.password, this.email});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
