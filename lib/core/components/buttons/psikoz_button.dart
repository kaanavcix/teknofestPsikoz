import 'package:flutter/material.dart';
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
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [EmbabedUtility.socialblue,EmbabedUtility.socialPurple]),
          
           
            borderRadius: BorderRadius.circular(80),
          ),
          child: Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: child)),
        ),
      ),
    );
  }
}
