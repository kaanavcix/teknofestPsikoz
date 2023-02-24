import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utility/embabed/embabed_utility.dart';

class PsikozGradientButton extends StatelessWidget {
  PsikozGradientButton({
    required this.onTap,
    required this.text,
    super.key,
  });
  final String text;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            gradient: const LinearGradient(
                colors: [Color(0xffF62E8E), Color(0xffAC1AF0)])),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Text(
              "Giriş yap",
              style: Get.textTheme.bodyLarge!.copyWith(
                 
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class PsikozOnboardButton extends StatelessWidget {
  PsikozOnboardButton({
    this.paddingValue,
    super.key,
    required this.onTap,
    required this.text,
  });
  final String text;
  void Function()? onTap;
  Color? normalColor;
  double? paddingValue;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: EmbabedUtility.socialPink),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: paddingValue ?? 20,
            ),
            child: Center(
              child: Text(text, style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
