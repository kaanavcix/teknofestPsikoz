import 'dart:ffi';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/components/post/post_bar.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';

import 'package:psikoz/core/service/firebase/firebase_db.dart';
import 'package:psikoz/controller/home_controller.dart';
import 'package:psikoz/core/utility/app/duration_utilty.dart';
import 'package:psikoz/core/utility/app/scroll_pyhcis_utility.dart';
import 'package:psikoz/core/utility/app/sized_box_dummy.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/product/widgets/discovery_card.dart';
import 'package:psikoz/view/alert/email_view.dart';
import 'package:psikoz/view/home/comment_view.dart';
import 'package:psikoz/view/home/search_view..dart';
import 'package:psikoz/view/home/widgets/feel_bar.dart';

import '../../core/constants/app/app_constant.dart';
import '../../core/constants/app/app_size_constant.dart';
import '../../core/utility/app/padding_utility.dart';
import '../../product/widgets/top_card.dart';
import '../../product/widgets/trend_card.dart';
import 'widgets/message_icon_button.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController controllers = ScrollController();
    var db = Get.find<FirebaseDb>();
    return Scaffold(
        appBar: appbar(db),
        body: SizedBox(
            height: Get.height,
            child: LiquidPullToRefresh(
              showChildOpacityTransition: false,
              height: 55,
              springAnimationDurationInMilliseconds: 50,
              color: EmbabedUtility.socialPurple,
              onRefresh: () async {
                await controller.onrefresh();
                controllers.jumpTo(0);
              },
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (notification) {
                  notification.disallowIndicator();
                  return true;
                },
                child: ListView(
                  controller: controllers,
                  clipBehavior: Clip.none,
                  children: [
                    smallCard(),
                    middleBar(AppConstant.discoveryTrend),
                    trendScroll(),
                    SizedBoxDummy.height(
                      height: 5,
                    ),
                    middleBar(AppConstant.recommenededMaterial),
                    mediumLayout(),
                    Text("Short podcast article book"),
                    Placeholder(fallbackHeight: 100),
                    Text("quiz reletaing to phys"),
                    Placeholder(fallbackHeight: 200),
                    Text("Short podcast article book"),
                  ],
                ),
              ),
            )));
  }

  AppBar appbar(FirebaseDb db) {
    return AppBar(
        actions: [
          IconButton(
              onPressed: () => Get.to(SearchView()),
              icon: IconNames.search.tosvgPictureConvert(null)),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ))
        ],
        title: Obx(() => db.user.isEmpty
            ? const SizedBox.shrink()
            : Text(
                "${controller.frontText.value},${db.user.first.firstName}",
                style: Get.textTheme.bodyMedium,
              )));
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

  SizedBox mediumLayout() {
    return SizedBox(
      //  height: 300,
      width: Get.width,
    

      child: ListView.builder(
        physics: ScrollPyhcisyUtilty.neverScroll(),
        shrinkWrap: true,
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return DiscoverCard();
        },
      ),
    );
  }

  Padding middleBar(
    String text,
  ) {
    return Padding(
      padding: PaddinUtilty.normalPadding().padding,
      child: Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              const Icon(
                Icons.arrow_back_ios_outlined,
                textDirection: TextDirection.rtl,
              )
            ],
          ))),
    );
  }

  SizedBox trendScroll() {
    return SizedBox(
        height: AppSizeConstant.cardSize200,
        child: Padding(
          padding: PaddinUtilty.leftPadding().padding,
          child: ListView.builder(
            physics: ScrollPyhcisyUtilty.bouncAlways(),
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return TrendCard();
            },
          ),
        ));
  }
}
