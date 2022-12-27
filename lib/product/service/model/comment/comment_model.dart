class CommentModel {
  bool? success;
  List<Data>? data;

  CommentModel({this.success, this.data});

  CommentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

}

class Data {
  int? id;
  int? postId;
  int? userId;
  String? username;
  String? name;
  String? comment;
  String? joinedAt;

  Data(
      {this.id,
      this.postId,
      this.userId,
      this.username,
      this.name,
      this.comment,
      this.joinedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    userId = json['user_id'];
    username = json['username'];
    name = json['name'];
    comment = json['comment'];
    joinedAt = json['joined_at'];
  }


}
