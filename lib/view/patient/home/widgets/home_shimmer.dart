
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../controller/home_controller.dart';
import '../../../../core/constants/app/app_size_constant.dart';
import '../../../../core/utility/app/padding_utility.dart';
import '../../../../core/utility/app/scroll_pyhcis_utility.dart';
import '../../../../core/utility/app/sized_box_dummy.dart';
import '../../../../product/widgets/discovery_card.dart';
import '../../../../product/widgets/top_card.dart';
import '../../../../product/widgets/trend_card.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Shimmer.fromColors(
              baseColor: Colors.grey.shade600,
              highlightColor: Colors.grey.shade800,
              direction: ShimmerDirection.ltr,
              enabled: true,
              child: ListView(
                physics: ScrollPyhcisyUtilty.bouncAlways(),
                controller: controller.controllers,
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: TopCard(subText: "", topText: ""),
                  ),
                  SizedBoxDummy.height(),
                 SizedBox(
        height: AppSizeConstant.cardSize200,
        child: Padding(
          padding: PaddinUtilty.leftPadding().padding,
          child: ListView.builder(
            physics: ScrollPyhcisyUtilty.bouncAlways(),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
           
              return TrendCard(
                text: "",
                name: "",
                url:null ,
              );
            },
          ),
        )),
                  const SizedBoxDummy.height(
                    height: 10,
                  ),
                 
                  DiscoverCard(text1: "",text2: "",onTap: null),
                    DiscoverCard(text1: "",text2: "",onTap: null),
                      DiscoverCard(text1: "",text2: "",onTap: null),
                        DiscoverCard(text1: "",text2: "",onTap: null),
                          DiscoverCard(text1: "",text2: "",onTap: null),
                            DiscoverCard(text1: "",text2: "",onTap: null),
                
                ],
              )),
        )
      ],
    );
  }
}