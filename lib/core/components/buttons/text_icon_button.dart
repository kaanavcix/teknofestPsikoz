import 'package:flutter/material.dart';

import '../../utility/embabed/embabed_utility.dart';

class TextIconButton extends StatelessWidget {
  TextIconButton({
    this.data,
    this.text,
    required this.onPressed,
    super.key,
  });
  Widget? data;
  String? text;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
         // fixedSize: Size.fromHeight(48),
            //alignment: Alignment.centerLeft,
            minimumSize: const Size.fromHeight(40.0),
            maximumSize: const Size.fromHeight(40.0),

            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(9)),
            side: const BorderSide(
              color: EmbabedUtility.socialLightGray,
              width: 0.3,
            )),
        onPressed: onPressed,
        icon: data ?? Icon(Icons.apple),
        label: Text(
          text ?? "Apple ile devam edin",
          style:Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)
            //  Get.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        ));
  }
}