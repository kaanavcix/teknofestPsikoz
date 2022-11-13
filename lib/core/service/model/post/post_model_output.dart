import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:psikoz/core/service/model/user_model.dart';

class PostOutput {
  int? id;
  String? created;
  String? message;
  String? categoryName;
  String? userName;
  String? image;
  bool? isAnonim;

  PostOutput.fromMap(DocumentSnapshot map, UserInfos personInfo, String categoryNames) {
    id = map['Id'];
    created = map['Created'];
    message = map['Message'];
    categoryName = categoryNames;
    userName = personInfo.username;

    image = personInfo.image;

    isAnonim = map['IsAnonim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['created'] = created;
    data['message'] = message;
    data['categoryName'] = categoryName;
    data['userName'] = userName;
    data['image'] = image;
    data['isAnonim'] = isAnonim;
    return data;
  }
}
