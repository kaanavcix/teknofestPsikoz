import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/service/firebase/firebase_db.dart';
import 'package:psikoz/product/widgets/discovery_view.dart';
import 'package:psikoz/view/post/post_article_view.dart';
import 'package:psikoz/view/post/post_forum_view.dart';
import 'package:psikoz/view/post/post_view.dart';
import 'package:psikoz/view/profile/profile_view.dart';
import 'package:psikoz/view/home/search_view..dart';

import '../../../view/home/home_view..dart';

var db = Get.find<FirebaseDb>();

List<Widget> pages = [
  HomeView(),
  db.user.first.claimsId != "6" ? PostForumView() : PostForumView(),
  ProfileView()
];
