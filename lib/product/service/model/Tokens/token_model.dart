import '../result/result_model.dart';

class TokenModel extends BaseModel{
  bool? status;
  int? message;
  String? token;

  TokenModel({this.status, this.message, this.token});

  TokenModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] =  status;
    data['message'] =  message;
    data['token'] =  token;
    return data;
  }
}