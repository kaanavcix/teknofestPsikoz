class ErrorModel extends BaseModel{
  bool? status;
  int? message;

  ErrorModel({this.status, this.message});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class SuccessModel extends BaseModel{
  bool? success;

  SuccessModel({this.success});

  SuccessModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
  }
}

abstract class BaseModel {
  bool? success;
  BaseModel({this.success});
}
