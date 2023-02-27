import 'package:flutter/material.dart';
import 'package:psikoz/core/utility/app/gradient-utility.dart';

import '../../../core/utility/embabed/embabed_utility.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
  
    required this.text,
    required this.onPressed,
  }) : super(key: key);


  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(9),
      onTap: onPressed,
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          gradient: text.contains("Geri")? LinearGradient(colors: [Colors.grey,Colors.grey]) :GradientUtility.dicoverGradient,
          borderRadius: BorderRadius.circular(9)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text(text,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold
          ),)),
        ),
      ),
    );
  }
}
