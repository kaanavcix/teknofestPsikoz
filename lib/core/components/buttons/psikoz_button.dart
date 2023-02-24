import 'package:flutter/material.dart';
import 'package:psikoz/core/constants/app/app_size_constant.dart';
import '../../utility/embabed/embabed_utility.dart';
import '../../../product/init/theme/text_theme.dart';

class PsikozButton extends StatelessWidget {
  PsikozButton({
    required this.onTap,
    required this.child,
    Key? key,
  }) : super(key: key);
  Widget child;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    const linearGradient = LinearGradient(end: Alignment.bottomRight,
    begin: Alignment.bottomLeft,//stops: [0.2,0.8],
        colors: [EmbabedUtility.socialPink, EmbabedUtility.socialPurple]);
    return GestureDetector(
      
      onTap: onTap,
      child: Card(
        elevation: AppSizeConstant.elevation8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        child: Container(
          height: 40.0,
          decoration: BoxDecoration(
            
            gradient: linearGradient,
          // color: EmbabedUtility.socialPurple,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Center(
              child: child),
        ),
      ),
    );
  }
}
