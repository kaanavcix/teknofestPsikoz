import 'package:cloud_firestore/cloud_firestore.dart';

class PostModelForInput {
  final int? id;
  final DateTime? createdTime;
  final String? message;
  final int? categoryId;
  final String? userId;
  final bool? isAnonim;
  final List<String>? images;

  PostModelForInput(
      {this.id,
      this.createdTime,
      this.message,
      this.categoryId,
      this.userId,
      this.isAnonim,
      this.images});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Id'] = id;
    data['Created'] = createdTime;
    data["Images"] = images;
    data['Message'] = message;
    data['CategoryId'] = categoryId;
    data['UserId'] = userId;
    data['IsAnonim'] = isAnonim;
    return data;
  }
}
