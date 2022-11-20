import 'package:flutter/material.dart';

import '../../utility/app/gradient-utility.dart';

class FaceContainer extends StatelessWidget {
  FaceContainer({Key? key, this.widget}) : super(key: key);

  Widget? widget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //data
      },
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
            gradient: GradientUtility.socialGradient,
            borderRadius: BorderRadius.circular(23)),
        child: Center(child: widget),
      ),
    );
  }
}
