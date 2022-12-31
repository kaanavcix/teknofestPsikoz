// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:psikoz/main.dart';
import 'package:psikoz/product/service/model/onborading/register_model.dart';
import 'package:psikoz/product/service/model/post/post_model_input.dart';
import 'package:psikoz/product/service/service/dio_service.dart';
import 'package:psikoz/product/service/service/dio_service_db.dart';

void main() {
  group("Genel test", () {});

  test("Comment data", (() {
    DioServiceDb(Dio(BaseOptions(baseUrl: "http://192.168.192.1:8080/api/")))
        .getComments(11);
  }));

  test("User data", ((() {})));

  test("PostModel", () async {
    var data = await DioServiceDb(
            Dio(BaseOptions(baseUrl: "http://192.168.192.1:8080/api/")))
        .add(PostInputModel(userId: 925, content: "sdavfnmskafafsfdfasdfsdaf"));
    expect(data, equals(data));
  });

  test("Register Model doctor", () async {
    var data2 = await DioServiceOnboard(
            Dio(BaseOptions(baseUrl: "http://192.168.192.1:8080/api/")))
        .registerDoctor(RegisterModel(
                username: "ahmet",
                age: "24",
                email: "kean@bexbow.inc",
                gender: "1",
                isPatient: "0",
                name: "ahmet",
                password: "12314214123")
            .toFormData(
                "/data/user/0/com.bexbow.psikoz/cache/file_picker/IMG_20220824_232656.jpg",
                "/data/user/0/com.bexbow.psikoz/cache/file_picker/IMG_20220824_232656.jpg"),
                );
                 expect(data2,equals(data2));
  });
}
