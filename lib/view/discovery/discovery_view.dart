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
import 'package:psikoz/view/discovery/widgets/trend_card.dart';

import '../../product/widgets/discovery_card.dart';
import '../../product/widgets/top_card.dart';


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
            smallCard(),
            middleBar(),
            trendScroll(),
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

  SizedBox trendScroll() {
    return SizedBox(
              height: AppSizeConstant.cardSize200,
              child: Padding(
                padding: PaddinUtilty.leftPadding().padding ,
                child: ListView.builder(
                  physics:ScrollPyhcisyUtilty.bouncAlways(),
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return TrendCard();
                  },
                ),
              ));
  }

  Padding middleBar() {
    return Padding(
            padding:  PaddinUtilty.normalPadding().padding,
            child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const[
                    Text(AppConstant.discoveryTrend),
                    Icon(
                      Icons.arrow_back_ios_outlined,
                      textDirection: TextDirection.rtl,
                    )
                  ],
                ))),
          );
  }

  SizedBox smallCard() {
    return SizedBox(
            height: kToolbarHeight,
            child: Swiper(
              itemCount: 4,
              layout: SwiperLayout.STACK,

              //  axisDirection: AxisDirection.down,
              scrollDirection: Axis.vertical,

              itemHeight: 55,
              allowImplicitScrolling: false,
              autoplay: true,
              autoplayDelay: 100,
              duration: 2000,
              itemWidth: Get.width * 0.8,
              curve: Curves.easeInBack,
              outer: true,
              //  indicatorLayout: PageIndicatorLayout.WARM,

              // pagination: SwiperPagination(),
              control: const SwiperControl(size: 0),
              itemBuilder: (context, index) {
                return TopCard(
                  topText: "Bu haftanın favori podcasti",
                  subText: "Dünya nasıl güzelleşir",
                );
              },
            ),
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





