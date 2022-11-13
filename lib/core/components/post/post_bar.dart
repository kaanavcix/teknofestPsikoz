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
      required this.profileUrl,
      required this.userName,
      required this.time,
      required this.imageList,
      required this.onTapLike,
      required this.onTapComment,
      required this.commentLenght,
      required this.likeLenght})
      : super(key: key);
  final String text;
  final String profileUrl;
  final String userName;
  final String time;
  final List<String> imageList;
  void Function()? onTapLike;
  void Function()? onTapComment;
  String likeLenght;
  String commentLenght;
  Color? colorLike;
    void Function()? onTapMore;


  @override
  Widget build(BuildContext context) {
    var edgeInsets = EdgeInsets.symmetric(horizontal: 15.0);
    return Container(
      
      child: Column(children: [
        sizedbox(),
        Padding(
          padding:  edgeInsets,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: EmbabedUtility.socialblue,
                backgroundImage:
                    profileUrl == "" ? null : NetworkImage(profileUrl),
              ),
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
                child: IconNames.dotsvertical.tosvgPictureConvert(Colors.white,height: 18,width: 18),
              ),
            ],
          ),
        ),
        Column(
          children: [
            imageList.isEmpty
                ? const SizedBox(
                    height: 0,
                    width: 0,
                  )
                : SizedBox(
                    height: 200,
                    width: Get.width,
                    child: ImageBar(profileUrlSet: imageList)),
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
                  IconNames.like
                      .tosvgPictureConvert(Colors.white, width: 18, height: 18),
                  likeLenght.toString(),
                  onTapLike),
              const Spacer(flex: 1),
              buttons(
                  IconNames.comment
                      .tosvgPictureConvert(Colors.white, width: 18, height: 18),
                  commentLenght.toString(),
                  onTapComment),
              const Spacer(flex: 1,),
             GestureDetector(
                child: IconNames.share
                    .tosvgPictureConvert(Colors.white, width: 18, height: 18),
              ),
             const Spacer(flex: 6,),
              GestureDetector(
                child: IconNames.bookmark
                    .tosvgPictureConvert(Colors.white, width: 18, height: 18),
              ),
                        

            ],
          ),
        ),
        sizedbox(),
        const MySeparator(
          color: EmbabedUtility.socialLightGray,
          height: 1,
        )
      ]),
    );
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
          child: 
               
               Text(
                  text.toString(),
                  style: grTertiary,
                ),
        )
      ],
    );
  }
}


// beğeni renk olayı gerekiyor