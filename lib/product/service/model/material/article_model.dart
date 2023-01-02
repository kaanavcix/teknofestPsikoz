class ArticleModel {
  bool? status;
  List<Data>? data;

  ArticleModel({this.status, this.data});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }

 
}

class Data {
  int? id;
  String? title;
  String? summary;
  String? content;
  String? image;
  String? categoryName;

  Data(
      {this.id,
      this.title,
      this.summary,
      this.content,
      this.image,
      this.categoryName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    summary = json['summary'];
    content = json['content'];
    image = json['image'];
    categoryName = json['categoryName'];
  }

}
