import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utility/embabed/embabed_utility.dart';
import '../post_view_2_page.dart';

class PostAppbar extends StatelessWidget with PreferredSizeWidget {
  PostAppbar({
    required this.labelText,
    required this.text,
    Key? key,
  }) : super(key: key);
  String text;
  String labelText;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 70,
      leading: TextButton(
        onPressed: () {
          Get.defaultDialog(
              title: "Emin misiniz? ",
              content: Text("Bu Gönderiyi silmek istediğinize eminmisiniz ? "));
        },
        child: Text(
          labelText,
          style: Get.textTheme.headlineLarge!.copyWith(
            color: EmbabedUtility.socialblue,
          ),
        ),
      ),
      centerTitle: true,
      title: Text(text, style: Get.textTheme.displayLarge),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
            child: ElevatedButton(
              onPressed: () {
                Get.to(PostValidatePage());
              },
              style: ElevatedButton.styleFrom(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48)),
                backgroundColor: EmbabedUtility.socialPurple,
              ),
              child: Text(
                "Paylaş",
                style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
