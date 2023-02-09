import '../result/result_model.dart';

class PostModel extends BaseModel {
  bool? success;
  List<Data>? data;

  PostModel({this.success, this.data});

  PostModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  String? content;
  String? status;
  String? category;
  String? username;
  int? age;
  List<Comment>? comment;
  int? gender;
  String? name;
  String? avatar;
  String? time;
  List<Likes>? likes;

  Data(
      {this.id,
      this.content,
      this.status,
      this.category,
      this.username,
      this.age,
      this.comment,
      this.gender,
      this.name,
      this.avatar,
      this.time,
      this.likes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    status = json['status'];
    category = json['category'];
    username = json['username'];
    age = json['age'];
    if (json['comment'] != null) {
      comment = <Comment>[];
      json['comment'].forEach((v) {
        comment!.add(Comment.fromJson(v));
      });
    }
    gender = json['gender'];
    name = json['name'];
    avatar = json['avatar'];
    time = json['time'];
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(Likes.fromJson(v));
      });
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$category , $name , $avatar , $time";
  }
}

class Comment {
  int? id;
  int? userId;
  String? comment;
  String? joinedAt;
  int? postId;

  Comment({this.id, this.userId, this.comment, this.joinedAt, this.postId});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    comment = json['comment'];
    joinedAt = json['joined_at'];
    postId = json['post_id'];
  }
}

class Likes {
  int? id;
  int? userId;
  int? postId;

  Likes({this.id, this.userId, this.postId});

  Likes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    postId = json['post_id'];
  }
}
