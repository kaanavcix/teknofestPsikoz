class SuccesResult {
  bool? success;
  String? message;

  SuccesResult({this.success, this.message});

  SuccesResult.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
