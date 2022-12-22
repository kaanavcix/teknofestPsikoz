import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/constants/app/app_constant.dart';
import 'package:psikoz/core/constants/app/app_size_constant.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/utility/app/gradient-utility.dart';
import 'package:psikoz/core/utility/app/padding_utility.dart';
import 'package:psikoz/core/utility/app/scroll_pyhcis_utility.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/product/widgets/trend_card.dart';

import 'discovery_card.dart';
import 'top_card.dart';


class DiscoveryView extends StatelessWidget {
  const DiscoveryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SizedBox(
        child: ListView(
         shrinkWrap: true,
          children: [
            
      
            subTitle(),
            bottomItemBlloc(),
          ],
        ),
      ),
    );
  }

  SizedBox bottomItemBlloc() {
    return SizedBox(
            width: Get.width,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPyhcisyUtilty.neverScroll(),
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return DiscoverCard();
              },
            ),
          );
  }

  Padding subTitle() {
    return Padding(
            padding:  PaddinUtilty.normalPadding().padding,
            child: const Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                    child: Text(AppConstant.discoverySubtitle))),
          );
  }





  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(AppConstant.discoveryTitle, style: Get.textTheme.bodyMedium),
      actions: [
        Padding(
            padding:  PaddinUtilty.normalPadding().padding,
            child: IconNames.alert.tosvgPictureConvert(null))
      ],
    );
  }
}





