import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:psikoz/core/constants/enums/image_enums.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: SvgPicture.asset(
      "assets/images/logo.svg",
      color: Colors.white,
      
      
    )),
    );
  }
}
