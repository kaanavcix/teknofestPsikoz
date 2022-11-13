import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/components/post/post_bar.dart';
import 'package:psikoz/core/components/post/side_writer_bar.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/init/theme/text_theme.dart';
import 'package:psikoz/core/service/firebase/firebase_db.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/product/controller/home_controller.dart';
import 'package:psikoz/product/view/alert/email_view.dart';
import 'package:psikoz/product/view/home/comment_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    var db = Get.find<FirebaseDb>();
    return Scaffold(
        appBar: AppBar(
            actions: [
              GestureDetector(
                onTap: () => controller.signout(),
                child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 0.4)),
                    child: IconNames.message.tosvgPictureConvert(Colors.white)),
              )
            ],
            title: Obx(() => db.user.isEmpty? SizedBox.shrink(): Text(
                  "${controller.frontText.value},${db.user.first.firstName}",
                  style: grBodyB.copyWith(color: Colors.white),
                ))),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          slivers: <Widget>[
            SliverToBoxAdapter(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SizedBox(height: Get.height * 0.22, child: denem()),
                ),
                const Divider(
                  color: EmbabedUtility.socialGray,
                  height: 1,
                  thickness: 1,
                )
              ],
            )),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {},
            ))
          ],
        ));
  }

  Widget denem() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: SideWriterBar(),
        );
      },
    );
  }
}
