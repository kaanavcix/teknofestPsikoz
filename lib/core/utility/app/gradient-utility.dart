import 'package:flutter/cupertino.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';

class GradientUtility {
  static const LinearGradient socialGradient = LinearGradient(
      colors: [EmbabedUtility.socialblue, EmbabedUtility.socialPurple],
      begin: Alignment.centerRight,
      end: Alignment.centerLeft);

  static const LinearGradient dicoverGradient = LinearGradient(
      colors: [EmbabedUtility.socialblue, EmbabedUtility.socialPurple],
      begin: Alignment.topRight,
      stops: [0.1, 0.7],
      end: Alignment.bottomLeft);
}
