import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/post/post_bar_image.dart';
import '../../components/seperators/seperators_line.dart';
import '../../constants/enums/Icon-enums.dart';
import '../../../product/init/theme/text_theme.dart';
import '../../utility/embabed/embabed_utility.dart';

class PostBar extends StatelessWidget {
  PostBar(this.onTapComment, this.onLongPress,
      {Key? key,
      required this.text,
      required this.userName,
      required this.time,
      required this.category})
      : super(key: key);
  final String text;

  final String userName;
  final String time;
  void Function()? onTapComment;

  Color? colorLike;
  String? status;
  void Function()? onTapMore;
  void Function()? onLongPress;
  String category;

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.symmetric(horizontal: 15.0);
    const edgeInsets2 = EdgeInsets.only(left: 8.0);
    return Column(children: [
      sizedbox(),
      Padding(
        padding: edgeInsets,
        child: GestureDetector(
          onLongPress: onLongPress,
          child: Row(
            children: [
              Padding(
                padding: edgeInsets2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          userName,
                          style: grSTextB,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: category!= ""? Row(
                            children: [
                              Text(
                                category,
                                style: grSTextB.copyWith(
                                    color: EmbabedUtility.socialPurple),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Icon(
                                Icons.verified_outlined,
                                size: 16,
                                color: EmbabedUtility.socialPurple,
                              )
                            ],
                          ):SizedBox(),
                        ),
                      ],
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
      const SizedBox(
        height: 5,
      ),
      onTapComment != null
          ? Padding(
              padding: edgeInsets,
              child: Row(
                children: [
                  buttons(
                      IconNames.comment
                          .tosvgPictureConvert(null, width: 18, height: 18),
                      // ignore: prefer_null_aware_operators
                      null,
                      onTapComment),
                  const Spacer(),
                  GestureDetector(
                    child: IconNames.bookmark
                        .tosvgPictureConvert(null, width: 18, height: 18),
                  ),
                ],
              ),
            )
          : sizedbox(),
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
    return GestureDetector(child: widget, onTap: onTap);
  }
}
