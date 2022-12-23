class RegisterModel {
  String? username;
  String? email;
  String? password;
  int? age;
  int? gender;
  bool? isPatient;

  RegisterModel(
      {this.username,
      this.email,
      this.password,
      this.age,
      this.gender,
      });

  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] =  username;
    data['email'] =  email;
    data['password'] =  password;
    data['age'] =  age;
    data['gender'] =  gender;
    data['is_patient'] =  isPatient;
    return data;
  }
}
