import 'package:flutter/material.dart';

import '../../../core/utility/embabed/embabed_utility.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
    required this.color,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final Color? color;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder()
            // RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ,
            disabledBackgroundColor: EmbabedUtility.socialGray,
            enableFeedback: true,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            backgroundColor: color),
        child: Text(text));
  }
}

