import 'package:flutter/material.dart';
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
      this.suffixIcon,this.validator})
      : super(key: key);
  TextEditingController? textcontroller;
  TextInputType? keyboardType;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool? obscureText;
  String? hintText;
  TextInputAction? textInputAction;
String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: validator,
        textInputAction: textInputAction,
        autocorrect: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: textcontroller,
        cursorColor: EmbabedUtility.socialLightGray,
        enableIMEPersonalizedLearning: true,
        enableSuggestions: true,
        keyboardAppearance: Brightness.dark,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: EmbabedUtility.socialblue,
                width: 0.6,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText),
        maxLines: 1,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
      ),
    );
  }
}
