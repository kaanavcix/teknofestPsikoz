class BookModel {
  bool? success;
  List<Data>? data;

  BookModel({this.success, this.data});

  BookModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
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
  String? content;
  String? summary;
  String? writer;
  String? date;
  String? image;

  Data(
      {this.id,
      this.title,
      this.content,
      this.summary,
      this.writer,
      this.date,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    summary = json['summary'];
    writer = json['writer'];
    date = json['date'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['summary'] = summary;
    data['writer'] = writer;
    data['date'] = date;
    data['image'] = image;
    return data;
  }
}
