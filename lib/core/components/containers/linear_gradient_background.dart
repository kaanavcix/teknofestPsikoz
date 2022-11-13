import 'package:flutter/material.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';

class LinearGradientBackground extends StatelessWidget {
  const LinearGradientBackground({
    Key? key,
    required this.widget,
  }) : super(key: key);
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: widget,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          EmbabedUtility.socialblue,
          EmbabedUtility.socialPurple
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)));
  }
}
