import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum LottieEnums { loading ,switchs }

extension LottieConvertData on LottieEnums {
  getLottie() {
    return Lottie.asset(
      "assets/lotties/$name.json",

    );
  }

  getLottieAnimation(
      {AlignmentGeometry? alignment, Animation<double>? controller}) {
    return Lottie.asset("assets/lotties/$name.json",
        alignment: alignment, controller: controller);
  }
}
