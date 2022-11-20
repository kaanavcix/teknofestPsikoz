import 'package:cloud_firestore/cloud_firestore.dart';

class PostModelForInput {
  final String? id;
  final Timestamp? createdTime;
  final String? message;
  final String? anonimname;
  final String? categroryName;
  final String? userId;
  final bool? isAnonim;
  final String? username;
  final String? age;
  final bool? gender;
  final List<String>? saves;
  final List<String>? likes;
  final bool? isLikeBloc;
  final bool? isCommentBloc;
// 0 is woman 1 is man
  PostModelForInput(
      {this.anonimname,this.saves,
      this.likes,
      this.isLikeBloc,
      this.isCommentBloc,
      this.id,
      this.createdTime,
      this.message,
      this.categroryName,
      this.userId,
      this.isAnonim,
      this.username,
      this.age,
      this.gender});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Id'] = id;
    data['Created'] = createdTime;
    data['Age'] = age;
    data["Anonimname"] = anonimname;
    data['Gender'] = gender;
    data['Message'] = message;
    data['Categroryname'] = categroryName;
    data['UserId'] = userId;
    data['IsAnonim'] = isAnonim;
    data['Saves'] = saves;
    data['Likes'] = likes;
    data['Username'] = username;

    data['IsLikeBloc'] = isLikeBloc;
    data['IsCommentBloc'] = isCommentBloc;
    return data;
  }
}
