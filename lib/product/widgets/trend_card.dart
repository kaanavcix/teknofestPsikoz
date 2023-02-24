import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/components/bottomNavigation/bottom_navigation.dart';

import '../../core/constants/app/app_size_constant.dart';
import '../../core/constants/enums/Icon-enums.dart';
import '../../core/utility/embabed/embabed_utility.dart';

class TrendCard extends StatelessWidget {
  String text;
  String name;
  String? url;
  TrendCard({
    required this.name,
    required this.text,
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const edgeInsets = const EdgeInsets.only(bottom: 4.0);
    return SizedBox(
      height: 100,
      width: 350,
      child: Card(
        elevation: AppSizeConstant.elevation8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: EmbabedUtility.scaffoaldBackgorund,
        child: Row(
          children: [
            Container(
              width: 130,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          url ?? "https://picsum.photos/200/300"))),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: edgeInsets,
                      child: Text(
                        "BIG DATA",
                        style: Get.textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            color: EmbabedUtility.socialblue),
                      ),
                    ),
                    Padding(
                      padding: edgeInsets,
                      child: Text(
                        text,

                        //  overflow: TextOverflow.fade,

                        style: Get.textTheme.titleSmall!.copyWith(),
                      ),
                    ),
                    Row(
                     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.star_border_outlined,size:16),
                            label: Text("2.1 k",style: Get.textTheme.titleSmall,)),

                            TextButton.icon(onPressed: () {
                              
                            }, icon: Icon(Icons.timelapse,size:16), label: Text("1 saat önce",style: Get.textTheme.titleSmall,)),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
