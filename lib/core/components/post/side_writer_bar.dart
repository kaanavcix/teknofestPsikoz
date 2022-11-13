import 'package:flutter/material.dart';

class SideWriterBar extends StatelessWidget {
  const SideWriterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 150,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(23),
              border: Border.all(
                width: 0.4,
                color: Colors.transparent.withOpacity(0.8),
              )),
        ),
        const Positioned(
            bottom: 15
            ,
            left: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: Colors.purple,
              radius: 24,
            )),
      ],
    );
  }
}
