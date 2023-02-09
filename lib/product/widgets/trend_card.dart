import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app/app_size_constant.dart';
import '../../core/utility/embabed/embabed_utility.dart';

class TrendCard extends StatelessWidget {
  String text;
  String name;
  String? url;
   TrendCard({
    required this.name,required this.text, required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizeConstant.cardSize200,
      width: AppSizeConstant.cardSize300,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        color: EmbabedUtility.darkBlack,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          bottomLeft: Radius.circular(32)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image:
                              NetworkImage(url ?? "https://picsum.photos/200/300"))),
                )),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.spaceEvenly,
                  runSpacing: 10,
                  children: [
                    Text(
                      text,

                      //  overflow: TextOverflow.fade,

                      style: Get.textTheme.displayLarge!.copyWith(
                          //color: Colors.black,
                          ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(backgroundColor: Colors.blue, radius: 15),
                        SizedBox(
                          width: 5,
                        ),
                        Text(name, style: Get.textTheme.bodyLarge!
                            //  .copyWith(color: EmbabedUtility.darkBlack),
                            )
                      ],
                    ),
                    Text(
                      "# etiket",
                      style: Get.textTheme.bodyLarge!
                          .copyWith(color: EmbabedUtility.socialblue),
                    )
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
