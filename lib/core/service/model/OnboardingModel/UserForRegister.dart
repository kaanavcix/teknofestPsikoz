class UserForRegister {
  String? userName;
  String? firstName;
  String? userId;
  String? password;
  String? email;

  UserForRegister(
      {this.userName, this.firstName, this.userId, this.password, this.email});

  UserForRegister.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    firstName = json['FirstName'];
    userId = json['UserId'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['userName'] = userName;
    data['FirstName'] = firstName;
    data['UserId'] = userId;
    data['password'] = password;
    data['email'] = email;
    return data;
  }
}
