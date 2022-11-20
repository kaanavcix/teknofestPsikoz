import 'dart:core';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostOutput {
  final String? id;
  final Timestamp? createdTime;
  final String? message;
  final bool? gender;
  final String? age;
  final int? categoryName;
  final String? username;
  final bool? isAnonim;
  final List<String>? saves;
  final List<String>? likes;
  final bool? isLikeBloc;
  final bool? isCommentBloc;
  final String? anonimname;

  factory PostOutput.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return PostOutput(
        id: data?["Id"],
        username: data?["Username"],
        categoryName: data?["Categoryname"],
        createdTime: data?["Created"],
        age: data?['Age'],
        anonimname: data?["Anonimname"],
        isAnonim: data?["IsAnonim"],
        isCommentBloc: data?["IsCommentBloc"],
        isLikeBloc: data?["IsLikeBloc"],
        likes: data?['Likes'] is Iterable ? List.from(data?['Likes']) : null,
        message: data?["Message"],
        saves: data?['Saves'] is Iterable ? List.from(data?['Saves']) : null,
        gender: data?["Gender"]);
  }

  PostOutput(
      {this.anonimname,this.id,
      this.createdTime,
      this.message,
      this.categoryName,
      this.username,
      this.age,
      this.isAnonim,
      this.gender,
      this.saves,
      this.likes,
      this.isLikeBloc,
      this.isCommentBloc});
}
