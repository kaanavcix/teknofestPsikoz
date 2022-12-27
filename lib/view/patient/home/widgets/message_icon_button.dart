import 'package:flutter/material.dart';

import '../../../../core/constants/enums/Icon-enums.dart';


// ignore: must_be_immutable
class MessageIconButton extends StatelessWidget {
   MessageIconButton({this.onTap,
    Key? key,
  }) : super(key: key);

void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 0.4)),
          child: IconNames.message.tosvgPictureConvert(null)),
    );
  }
}