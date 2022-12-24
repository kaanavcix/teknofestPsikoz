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
  @override
  String toString() {
    // TODO: implement toString
    return success.toString();
  }
}

class Data {
  int? id;
  int? userId;
  String? category;
  String? content;
  String? status;
  User? user;
  List<Comments>? comments;

  Data(
      {this.id,
      this.userId,
      this.category,
      this.content,
      this.status,
      this.user,
      this.comments});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    category = json['category'];
    content = json['content'];
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
  }
}

class User {
  int? id;
  String? username;
  String? avatar;
  int? age;
  int? gender;

  User({
    this.id,
    this.username,
    this.avatar,
    this.age,
    this.gender,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    username = json['username'];
    avatar = json['avatar'];
    age = json['age'];
    gender = json['gender'];
  }
}

class Comments {
  int? id;
  int? userId;
  String? comment;
  String? joinedAt;
  int? postId;

  Comments({this.id, this.userId, this.comment, this.joinedAt, this.postId});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    comment = json['comment'];
    joinedAt = json['joined_at'];
    postId = json['post_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['comment'] = comment;
    data['joined_at'] = joinedAt;
    data['post_id'] = postId;
    return data;
  }
}
