import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utility/embabed/embabed_utility.dart';

class PsikozTextBar extends StatelessWidget {
  PsikozTextBar(
      {Key? key,
      this.textInputAction,
      this.textcontroller,
      this.keyboardType,
      this.hintText,
      this.obscureText,
      this.prefixIcon,
      this.onTap,
      this.suffixIcon,
      this.validator,
      this.labelText})
      : super(key: key);
  TextEditingController? textcontroller;
  TextInputType? keyboardType;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool? obscureText;
  String? hintText;
  TextInputAction? textInputAction;
  void Function()? onTap;
  String? Function(String?)? validator;
  String? labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ) +
                EdgeInsets.only(bottom: 8),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(labelText ?? "E-mail")),
          ),
          TextFormField(
            style: Get.textTheme.titleSmall,
            validator: validator,
            onTap: onTap,
            textInputAction: textInputAction,
            autocorrect: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: textcontroller,
            cursorColor: EmbabedUtility.socialLightGray,
            enableIMEPersonalizedLearning: true,
            enableSuggestions: true,
            keyboardAppearance: Brightness.dark,
            decoration: InputDecoration(
                alignLabelWithHint: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                constraints: BoxConstraints(
                    minHeight: 48,
                  
                  ),
                fillColor: EmbabedUtility.scaffoaldBackgorund,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: EmbabedUtility.socialPink,
                    width: 0.6,
                  ),
                  borderRadius: BorderRadius.circular(9),
                ),
                suffixIcon: suffixIcon,
                hintText: hintText),
            maxLines: 1,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
          ),
        ],
      ),
    );
  }
}
