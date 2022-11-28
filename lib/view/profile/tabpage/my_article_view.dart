import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/constants/app/app_constant.dart';

import '../../../product/view/article_view_details.dart';
import '../../../product/widgets/discovery_card.dart';

class MyArticleView extends StatelessWidget {
  const MyArticleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Align(
              child: Text(
                AppConstant.profileArticleTitle,
                style: Get.textTheme.displaySmall,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return DiscoverCard(
                  onTap: () => Get.to(const ArticleDetailView()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


