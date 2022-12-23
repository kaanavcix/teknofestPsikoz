import '../result/result_model.dart';

class TokenModel extends BaseModel{
  String? status;
  int? message;
  String? token;

  TokenModel({this.status, this.message, this.token});

  TokenModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] =  status;
    data['message'] =  message;
    data['token'] =  token;
    return data;
  }
}