import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/post/post_bar_image.dart';
import '../../components/seperators/seperators_line.dart';
import '../../constants/enums/Icon-enums.dart';
import '../../init/theme/text_theme.dart';
import '../../utility/embabed/embabed_utility.dart';

class PostBar extends StatelessWidget {
  PostBar(
      {Key? key,
      required this.text,
      required this.userName,
      required this.time,
      required this.onTapLike,
      required this.onTapComment,
      required this.commentLenght,
      required this.likeLenght,required this.onLongPress})
      : super(key: key);
  final String text;

  final String userName;
  final String time;
  void Function()? onTapLike;
  void Function()? onTapComment;
  String likeLenght;
  String? commentLenght;
  Color? colorLike;
  void Function()? onTapMore;
  void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    var edgeInsets = const EdgeInsets.symmetric(horizontal: 15.0);
    return Column(children: [
      sizedbox(),
      Padding(
        padding: edgeInsets,
        child: GestureDetector
        (
          onLongPress: onLongPress,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: grSTextB,
                    ),
                    Text(
                      time,
                      style: grTertiary,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: onTapMore,
                child: IconNames.dotsvertical
                    .tosvgPictureConvert(Colors.white, height: 18, width: 18),
              ),
            ],
          ),
        ),
      ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: grSText,
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: edgeInsets,
        child: Row(
          children: [
            buttons(
                IconNames.like.tosvgPictureConvert(null, width: 18, height: 18),
                likeLenght.toString(),
                onTapLike),
            const Spacer(flex: 1),
            buttons(
                IconNames.comment
                    .tosvgPictureConvert(null, width: 18, height: 18),
                // ignore: prefer_null_aware_operators
                commentLenght ==null? "": commentLenght.toString(),
                onTapComment),
            const Spacer(
              flex: 1,
            ),
            const Spacer(
              flex: 6,
            ),
            GestureDetector(
              child: IconNames.bookmark
                  .tosvgPictureConvert(null, width: 18, height: 18),
            ),
          ],
        ),
      ),
      sizedbox(),
      const MySeparator(
        color: EmbabedUtility.socialLightGray,
        height: 1,
      )
    ]);
  }

  SizedBox sizedbox() => const SizedBox(
        height: 10,
      );

  Widget buttons(dynamic widget, String? text, void Function()? onTap) {
    return Row(
      children: [
        GestureDetector(child: widget, onTap: onTap),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text.toString(),
            style: grTertiary,
          ),
        )
      ],
    );
  }
}


// beğeni renk olayı gerekiyor