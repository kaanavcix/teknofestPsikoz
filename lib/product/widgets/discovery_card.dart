import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utility/embabed/embabed_utility.dart';

class DiscoverCard extends StatelessWidget {
  String? text1;
  String? text2;
  DiscoverCard({
    this.text1,this.text2,
    this.onTap,
    Key? key,
  }) : super(key: key);

  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8,
        color: EmbabedUtility.darkBlack,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: Get.width * 0.9,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(23)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: EmbabedUtility.socialLightGray,
                      borderRadius: BorderRadius.circular(5)),
                  child: Image.network("https://picsum.photos/200/300",
                      fit: BoxFit.cover),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.purple),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          text1 ??"",
                          style: Get.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    Text(text2??""),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timelapse,
                              size: 18,
                            ),
                            Text("1 hours ago",
                                style: Get.textTheme.titleMedium)
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
