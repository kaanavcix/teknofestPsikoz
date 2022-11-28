import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/service/firebase/firebase_db.dart';
import 'package:psikoz/view/discovery/discovery_view.dart';
import 'package:psikoz/view/post/post_article_view.dart';
import 'package:psikoz/view/post/post_view.dart';
import 'package:psikoz/view/profile/profile_view.dart';
import 'package:psikoz/view/search/search_view..dart';

import '../../../view/home/home_view..dart';

var db = Get.find<FirebaseDb>();

List<Widget> pages = [
  HomeView(),
  SearchView(),
  db.user.first.claimsId != "6" ? PostView() : PostArticleView(),
  DiscoveryView(),
  ProfileView()
];
