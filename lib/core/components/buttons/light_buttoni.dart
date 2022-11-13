import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UniveaLightButton extends StatelessWidget {
  final String title;
  void Function()? onPressed;
  UniveaLightButton({
    Key? key,
    required void Function()? onPressed,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    
      child: Text(title),
      onPressed: onPressed,
      
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.black,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(48))),
    );
  }
}
