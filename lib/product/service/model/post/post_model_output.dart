class PostModel {
  List<Data>? data;
  bool? success;

  PostModel({this.data, this.success});

  PostModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    success = json['success'];
  }
}

class Data {
  int? id;
  String? content;
  String? status;
  String? username;
  String? category;
  int? age;
  List<Comment>? comment;
  int? gender;
  String? name;
  String? avatar;

  Data(
      {this.id,
      this.content,
      this.status,
      this.username,
      this.age,
      this.comment,
      this.category,
      this.gender,
      this.name,
      this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    status = json['status'];
    username = json['username'];
    category = json['category'];
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
