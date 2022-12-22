import 'package:flutter/material.dart';
import 'package:psikoz/core/constants/app/app_size_constant.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';

import '../../utility/app/gradient-utility.dart';

class FaceContainer extends StatelessWidget {
  FaceContainer({Key? key, this.widget ,this.onTap}) : super(key: key);

  Widget? widget;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: AppSizeConstant.profileCard80,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              gradient: GradientUtility.socialGradient,
              borderRadius: BorderRadius.circular(23)),
          child: Center(child: widget),
        ),
      ),
    );
  }
}
