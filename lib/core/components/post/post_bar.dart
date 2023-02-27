import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/utility/app/padding_utility.dart';
import 'package:psikoz/core/utility/app/sized_box_dummy.dart';

import '../../components/post/post_bar_image.dart';
import '../../components/seperators/seperators_line.dart';
import '../../constants/enums/Icon-enums.dart';
import '../../../product/init/theme/text_theme.dart';
import '../../utility/embabed/embabed_utility.dart';

class PostBar extends StatelessWidget {
  PostBar(this.onTapComment, this.onLongPress, this.onTapMore,
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
    const edgeInsets2 = EdgeInsets.only(left: 3.0);
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
                          style: Get.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: category != "" ? verifyCategory() : SizedBox(),
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
                child: IconNames.dotsvertical.tosvgPictureConvert(
                    EmbabedUtility.socialwhite,
                    height: 24,
                    width: 24),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
        child: Text(
          textAlign: TextAlign.justify,
          text,
          style: Get.textTheme.titleSmall,
        ),
      ),
      SizedBox(
        height: 40,
        width: Get.width,
        child: Padding(
          padding: PaddinUtilty.horizontalPadding().padding,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Icon(
                        Icons.auto_awesome_sharp,
                        size: 18,
                      ),
                      Padding(
                        padding: PaddinUtilty.leftPadding().padding,
                        child: Text("123", style: Get.textTheme.titleSmall),
                      )
                    ],
                  )),
              onTapComment != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: buttons(
                          IconNames.comment
                              .tosvgPictureConvert(null, width: 18, height: 18),
                          // ignore: prefer_null_aware_operators
                          null,
                          onTapComment),
                    )
                  : sizedbox(),
              Spacer(),
              GestureDetector(
                child: IconNames.bookmark
                    .tosvgPictureConvert(null, width: 18, height: 18),
              ),
            ],
          ),
        ),
      ),
      sizedbox(),
      const MySeparator(
        color: EmbabedUtility.socialwhite,
        height: 1,
      )
    ]);
  }

  Row verifyCategory() {
    return Row(
      children: [
        Text(
          category,
          style: grSTextB.copyWith(color: EmbabedUtility.socialPurple),
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
    );
  }

  SizedBox sizedbox() => const SizedBox(
        height: 10,
      );

  Widget buttons(dynamic widget, String? text, void Function()? onTap) {
    return GestureDetector(child: widget, onTap: onTap);
  }
}
