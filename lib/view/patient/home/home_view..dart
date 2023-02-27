import 'package:card_swiper/card_swiper.dart';
import 'package:psikoz/view/patient/home/widgets/home_shimmer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/controller/user_controller.dart';
import 'package:psikoz/core/constants/app/app_array_constant.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/controller/home_controller.dart';
import 'package:psikoz/core/utility/app/scroll_pyhcis_utility.dart';
import 'package:psikoz/core/utility/app/sized_box_dummy.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/product/service/model/material/book_model.dart';
import 'package:psikoz/product/widgets/discovery_card.dart';
import 'package:psikoz/view/patient/home/bar_view.dart';

import '../../../core/constants/app/app_constant.dart';
import '../../../core/constants/app/app_size_constant.dart';
import '../../../core/global/dio_instance.dart';
import '../../../core/utility/app/padding_utility.dart';
import '../../../product/widgets/top_card.dart';
import '../../../product/widgets/trend_card.dart';
import 'search_view..dart';
import 'widgets/alert_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (_) => Scaffold(
            appBar: appbar(context),
            body: controller.isLoading.value
                ? HomeShimmer(controller: controller)
                : SizedBox(
                    height: Get.height,
                    child: RefreshIndicator(
                      color: EmbabedUtility.socialwhite,
                      onRefresh: controller.onrefresh,
                      child: Padding(
                        padding:PaddinUtilty.horizontalPadding().padding,
                        child: ListView(
                          physics: ScrollPyhcisyUtilty.bouncAlways(),
                          controller: controller.controllers,
                          clipBehavior: Clip.none,
                          children: [
                            smallCard(),
                            middleBar(
                                AppConstant.discoveryTrend, controller.bookModel),
                            trendScroll(),
                            const SizedBoxDummy.height(
                              height: 5,
                            ),
                            middleBar(AppConstant.recommenededMaterial,
                                controller.bookModel),
                            mediumLayout(),
                            DiscoverCard(text1:   "dENEME",text2: "Deneme2",),
                            //TODO: Podcast ve makaleler için card tasarımı yapılmalı
                            Text("Short podcast article book"),
                            Placeholder(fallbackHeight: 100),
                            Text("quiz reletaing to phys"),
                            Placeholder(fallbackHeight: 200),
                            Text("Short podcast article book"),
                          ],
                        ),
                      ),
                    ),
                  )));
  }

  AppBar appbar(BuildContext context) {
    var userController = Get.find<UserController>();

    return AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                // showSearch(context: context, delegate: SearchPageDelegate());
                Get.to(SearchView());
              },
              icon: IconNames.search.tosvgPictureConvert(null)),
          IconButton(
              onPressed: () => Get.to(AlertView()),
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ))
        ],
        title: Text(
          userController.userModel?.data?.name ?? "",
         // style: Get.textTheme.bodyMedium.copyWith(),
        ));
  }

  SizedBox smallCard() {
    return SizedBox(
      height: kToolbarHeight,
      child: Swiper(
        itemCount: controller.musicModel?.data?.length ?? 0,
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
          var model = controller.musicModel?.data?[index];
          return TopCard(
            topText: model?.title,
            subText: model?.content,
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
         prototypeItem: DiscoverCard(),
        physics: ScrollPyhcisyUtilty.neverScroll(),
        shrinkWrap: true,
        itemCount: controller.articleModel!.data!.length ,
        itemBuilder: (BuildContext context, int index) {
          var model = controller.articleModel!.data![index];
          return DiscoverCard(
            text1: model.categoryName,
            text2: model.title,
          );
        },
      ),
    );
  }

  Padding middleBar(String text, BookModel? bookModel) {
    return Padding(
      padding: PaddinUtilty.verticalPadding().padding,
      child: Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,style: Get.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold,letterSpacing: 0.8),),
              InkWell(
                onTap: () => Get.to(BarView(text, bookModel)),
                child: const Icon(
                  Icons.arrow_back_ios_outlined,
                  textDirection: TextDirection.rtl,
                ),
              )
            ],
          ))),
    );
  }

  Widget trendScroll() {
    return Padding(
      padding: PaddinUtilty.verticalPadding(height: 8,).padding,
      child: SizedBox(
          height: 150,
          child: Padding(
            padding: PaddinUtilty.leftPadding().padding,
            child: ListView.builder(
              physics: ScrollPyhcisyUtilty.bouncAlways(),
              itemCount: controller.bookModel!.data!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                var model = controller.bookModel?.data?[index];
                
             //   var data = (model!.image!).split("/");
                return TrendCard(
            hoursAgo: model?.date,
            likeCount: 2,
            title: model?.title,
                  url:  "https://picsum.photos/200/300",
                );
              },
            ),
          )),
    );
  }
}

class SearchPageDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text("İptal et"))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Center(child: Text("Lütfen birşeyler aratın"));
    } else {
      return ListView(
        children: AppArrayConstant.ageClass
            .map((e) => ListTile(
                  title: Text(e.toString()),
                ))
            .toList(),
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: AppArrayConstant.ageClass
          .map((e) => ListTile(
                title: Text(e.toString()),
              ))
          .toList(),
    );
  }
}
