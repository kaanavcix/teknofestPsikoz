import 'package:flutter/material.dart';

class AnimtedIcon extends StatelessWidget {
  Animation<double> progress;

  AnimtedIcon({
    Key? key,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        
        decoration: BoxDecoration(
          color: Colors.transparent,
            border: Border.all(color: Colors.white, width: 0.4),
            shape: BoxShape.circle),
        child: AnimatedIcon(
          icon: AnimatedIcons.close_menu,
          progress: progress,
          color: Colors.white,
        ));
  }
}
