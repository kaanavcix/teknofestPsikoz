import 'package:dio/dio.dart';

class RegisterModel {
  String? username;
  String? email;
  String? password;
  String? name;
  
  String? age;
  String? gender;
  String? isPatient;

  RegisterModel({
    this.username,
    this.email,
    this.password,
    this.age,
    this.gender,
    this.name,
    this.isPatient
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['age'] = age;
    data['name'] = name;

    data['gender'] = gender;
    data['is_patient'] = isPatient;
    return data;
  }



   toFormData(String filePath,String filename) async {
 return FormData.fromMap({
    "username": username,
    "email": email,
    "password": password,
    "name": name,
    "age": age,
    "gender": gender,
    "is_patient": isPatient,
    "file": await MultipartFile.fromFile(filePath,filename: filename)
  });
  }
 
}
