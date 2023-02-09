import 'package:flutter/material.dart';
import 'package:psikoz/view/doctor/profile/profile_view.dart';

import '../../../view/doctor/home/home_view.dart';
import '../../../view/doctor/material/material_view.dart';
import '../../../view/patient/home/home_view..dart';
import '../../../view/patient/post/post_forum_view.dart';
import '../../../view/patient/profile/profile_view.dart';

List<Widget> pages = [HomeView(), PostForumView(), ProfileView()];

List<Widget> doctorPages = [
  HomeViewDoctor(),
  MaterialViewDoctor(),
  ProfileViewDoctor()
];
