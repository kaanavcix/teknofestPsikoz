import 'dart:io';

import 'package:dio/dio.dart';
import 'package:psikoz/product/service/model/comment/comment_model.dart';
import 'package:psikoz/product/service/model/material/article_model.dart';
import 'package:psikoz/product/service/model/material/book_model.dart';
import 'package:psikoz/product/service/model/material/music_model.dart';
import 'package:psikoz/product/service/model/user/user_model.dart';

import '../../base/IDioService2.dart';
import '../model/post/post_model_input.dart';
import '../model/post/post_model_output.dart';
import '../model/result/result_model.dart';

class DioServiceDb extends IDioServiceMain {
  DioServiceDb(super.dio);

  @override
  Future<PostModel> getAll() async {
    try {
      var response = await dio.get(PostPath.posts.name);

      if (response.statusCode == 200) {
        var data = response.data;

        if (data is Map<String, dynamic>) {
          return PostModel.fromJson(data);
        }
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return PostModel();
  }

  @override
  Future<Object?> add(PostInputModel model) async {
    try {
      var response = await dio.post(
        PostPath.post.name,
        data: model,
      );

      if (response.statusCode == 200) {
        var data = response.data;

        if (data is Map<String, dynamic>) {
          return SuccessModel.fromJson(data);
        }
      } else if (response.statusCode == 404) {
        var data = response.data;
        return ErrorModel.fromJson(data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
  }

  @override
  Future<Object?> remove(String postid) async {
    try {
      var response = await dio.delete(
        "${PostPath.post.name}/$postid",
      );

      if (response.statusCode == 200) {
        var data = response.data;

        if (data is Map<String, dynamic>) {
          return SuccessModel.fromJson(data);
        }
      } else if (response.statusCode == 404) {
        var data = response.data;
        return ErrorModel.fromJson(data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
  }

  @override
  Future<Object?> update(PostInputModel model, String postid) async {
    try {
      var response =
          await dio.put("${PostPath.post.name}/$postid", data: model);

      if (response.statusCode == 200) {
        var data = response.data;

        if (data is Map<String, dynamic>) {
          return SuccessModel.fromJson(data);
        }
      } else if (response.statusCode == 404) {
        var data = response.data;
        return ErrorModel.fromJson(data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
  }

  @override
  Future<PostModel> getbyid(String postid) async {
    try {
      var response = await dio.get("${PostPath.post.name}/$postid");

      if (response.statusCode == 200) {
        var data = response.data;

        if (data is Map<String, dynamic>) {
          return PostModel.fromJson(data);
        }
      } else if (response.statusCode == 404) {
        var data = response.data;
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return PostModel();
  }

  @override
  Future<MusicModel> getMusics() async {
    var response = await dio.get(PostPath.musics.name);

    if (response.statusCode == 200) {
      var data = response.data;

      if (data is Map<String, dynamic>) {
        return MusicModel.fromJson(data);
      }
    }
    return MusicModel();
  }

  @override
  Future<ArticleModel> getArticles() async {
    var response = await dio.get(PostPath.articles.name);

    if (response.statusCode == 200) {
      var data = response.data;

      if (data is Map<String, dynamic>) {
        return ArticleModel.fromJson(data);
      }
    }
    return ArticleModel();
  }

  @override
  Future<BookModel> getBooks() async {
    var response = await dio.get(PostPath.books.name);

    if (response.statusCode == 200) {
      var data = response.data;

      if (data is Map<String, dynamic>) {
        return BookModel.fromJson(data);
      }
    }
    return BookModel();
  }

  @override
  Future<CommentModel?> getComments(int id) async {
    try {
      var response =
          await dio.get("${PostPath.post.name}/$id/${PostPath.comments.name}");

      if (response.statusCode == 200) {
        var data = response.data;
        if (data is Map<String, dynamic>) {
          return CommentModel.fromJson(data);
        }
      }
    } on DioError catch (e) {
      print(e.message);
    }
  }

  @override
  Future<BaseModel?> getmypost(TokenInputModel tokenInputModel) async {
    try {
      var response =
          await dio.post(PostPath.myposts.name, data: tokenInputModel);

      if (response.statusCode == 200) {
        var data = response.data;

        if (data is Map<String, dynamic>) {
          return PostModel.fromJson(data);
        }
      }
      if (response.statusCode == 201) {
        return SuccessModel.fromJson(response.data);
      }
      ;

      return ErrorModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.message);
    }
  }
}

enum PostPath { posts, post, musics, articles, books, comments, myposts }



 //\\  post/11/comments