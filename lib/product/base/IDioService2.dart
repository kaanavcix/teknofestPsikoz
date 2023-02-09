import 'package:dio/dio.dart';
import 'package:psikoz/product/service/model/material/article_model.dart';
import 'package:psikoz/product/service/model/material/book_model.dart';
import 'package:psikoz/product/service/model/material/music_model.dart';
import 'package:psikoz/product/service/model/post/post_model_input.dart';
import 'package:psikoz/product/service/model/post/post_model_output.dart';
import 'package:psikoz/product/service/model/result/result_model.dart';
import 'package:psikoz/product/service/model/user/user_model.dart';

import '../service/model/comment/comment_model.dart';

abstract class IDioServiceMain {
  final Dio dio;

  IDioServiceMain(this.dio);

  Future<PostModel> getAll();
  Future<PostModel> getbyid(String postid);
  Future<Object?> update(PostInputModel model, String postid);
  Future<Object?> add(PostInputModel model);
  Future<Object?> remove(String postid);
  Future<MusicModel> getMusics();
  Future<ArticleModel> getArticles();
  Future<BookModel> getBooks();
  Future<CommentModel?> getComments(int id);
  Future<BaseModel?> getmypost(TokenInputModel tokenInputModel);
}
