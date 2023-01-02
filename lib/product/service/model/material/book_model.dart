class BookModel {
  bool? sucess;
  List<Data>? data;

  BookModel({this.sucess, this.data});

  BookModel.fromJson(Map<String, dynamic> json) {
    sucess = json['sucess'];
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
  String? title;
  String? content;
  String? summary;
  Null? image;
  String? createdAt;

  Data(
      {this.id,
      this.title,
      this.content,
      this.summary,
      this.image,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    summary = json['summary'];
    image = json['image'];
    createdAt = json['createdAt'];
  }

  
}
