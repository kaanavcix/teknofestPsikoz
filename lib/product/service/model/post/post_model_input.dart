class PostInputModel {
  int? userId;
  String? content;
  PostInputModel({this.userId,  this.content});

  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] =  userId;
    data['content'] =  content;
    return data;
  }
}
