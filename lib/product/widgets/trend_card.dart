import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/components/bottomNavigation/bottom_navigation.dart';
import 'package:psikoz/core/utility/app/padding_utility.dart';

import '../../core/constants/app/app_size_constant.dart';
import '../../core/constants/enums/Icon-enums.dart';
import '../../core/utility/embabed/embabed_utility.dart';

class TrendCard extends StatelessWidget {
  String? title;
  String? category;
  int? likeCount;
  String? hoursAgo;

  String? url;
  TrendCard({
    this.category,
    this.hoursAgo,
    this.likeCount,
    this.title,
    this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.only(bottom: 4.0);
    var copyWith = Get.textTheme.titleSmall!
        .copyWith(fontSize: 12, fontWeight: FontWeight.w400);
    return Padding(
      padding: PaddinUtilty.horizontalPadding().padding,
      child: SizedBox(
        height: 100,
        width: 350,
        child: Card(
          elevation: AppSizeConstant.elevation8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                          category ?? "BIG DATA",
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
                          title ?? "",

                          //  overflow: TextOverflow.fade,

                          style: copyWith,
                        ),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.star_border_outlined, size: 16),
                              label: Text("$likeCount k", style: copyWith)),
                          TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.timelapse, size: 16),
                              label: Text(hoursAgo ?? "", style: copyWith)),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
