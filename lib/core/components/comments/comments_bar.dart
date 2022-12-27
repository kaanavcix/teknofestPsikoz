import 'package:flutter/material.dart';
import '../../components/bottomNavigation/bottom_navigation.dart';
import '../../constants/enums/Icon-enums.dart';
import '../../utility/embabed/embabed_utility.dart';

class CommentsBar extends StatelessWidget {
  const CommentsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            color: EmbabedUtility.socialGray,
            borderRadius: BorderRadius.circular(32)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                flex: 8,
                child: TextFormField(
                  enableIMEPersonalizedLearning: true,
                  enableSuggestions: true,
                  decoration: const InputDecoration(
                      enabled: true,
                      filled: false,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: IconNormal(
                      child: IconNames.plus.tosvgPictureConvert(
                          EmbabedUtility.socialLightGray))),
              Expanded(
                  flex: 1,
                  child: IconCircular(
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: IconNames.send
                              .tosvgPictureConvert(Colors.white))))
            ],
          ),
        ),
      ),
    );
  }
}
