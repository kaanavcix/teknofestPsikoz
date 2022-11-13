class TokenModel {
  Data? data;
  bool? success;
  String? message;

  TokenModel({this.data, this.success, this.message});

  TokenModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}

class Data {
  String? token;
  String? expiration;

  Data({this.token, this.expiration});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['token'] = token;
    data['expiration'] = expiration;
    return data;
  }
}
