import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageBar extends StatelessWidget {
  ImageBar({Key? key, this.profileUrlSet}) : super(key: key);
  List<String>? profileUrlSet;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: profileUrlSet!.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: NetworkImage(profileUrlSet![index])),
                borderRadius: BorderRadius.circular(16)),
          ),
        );
      },
    );
  }
}
