import 'package:flutter/material.dart';
import 'package:psikoz/controller/general_control_controller.dart';
import 'package:psikoz/core/components/iconWidget/leading_widget.dart';
import 'package:psikoz/core/components/inputbar/search_bar_widget.dart';
import 'package:psikoz/core/components/seperators/seperators_line.dart';
import 'package:psikoz/core/constants/app/app_constant.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/global/dio_instance.dart';
import 'package:psikoz/core/utility/app/gradient-utility.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';

import 'package:get/get.dart';
import 'package:psikoz/product/service/service/dio_service_db.dart';

import '../../../product/init/theme/text_theme.dart';
import 'message_detail_view.dart';

class GeneralControlView extends GetView<GeneralControlController> {
  GeneralControlView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
        GeneralControlController(DioServiceDb(DioInstanceTsApi.instance.dio)));
    const edgeInsets = EdgeInsets.only(right: 8);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [
            Padding(
              padding: edgeInsets,
              child: GestureDetector(
                onTap: () {},
                child: IconNames.settings.tosvgPictureConvert(null),
              ),
            )
          ],
          title: Text(AppConstant.appointmentAppBarTitle,
              style: Get.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ) +
              const EdgeInsets.only(top: 4),
          child: Column(
            children: [
              Obx(() => topTabbar()),
              Obx(() => Expanded(child: tabbarContent[controller.index.value]))
            ],
          ),
        ));
  }

  List<Widget> tabbarContent = [
    Container(
      color: Colors.pink,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.red,
    )
  ];

  Widget topTabbar() {
    return Container(
      width: Get.width,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: EmbabedUtility.socialwhite),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          tabbarcard("Gönderiler", controller.index.value == 0, () {
            controller.index.value = 0;
          }),
          tabbarcard("Planlanmış ", controller.index.value == 1, () {
            controller.index.value = 1;
          }),
          tabbarcard("Geçmiş", controller.index.value == 2, () {
            controller.index.value = 2;
          })
        ],
      ),
    );
  }

  Widget tabbarcard(String text, bool isSelected, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInCubic,
        width: Get.width * 0.31,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            gradient: isSelected ? GradientUtility.dicoverGradient : null),
        child: Center(
          child: Text(
            text,
            style: Get.textTheme.bodyMedium!
                .copyWith(fontWeight: FontWeight.bold, letterSpacing: 0.5),
          ),
        ),
      ),
    );
  }
}

class MessageView extends StatelessWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: LeadingWidget(),
        centerTitle: true,
        actions: [SettingsWidget()],
        title: Text(
          "MESAJLAR",
          style: Get.textTheme.bodyLarge,
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 15),
            child: SearchBarWidget(),
          ),
          const MySeparator(
            color: EmbabedUtility.socialLightGray,
            height: 1,
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            onTap: () => Get.to(MessageDetailView()),
            leading: CircleAvatar(
              backgroundColor: Colors.pink,
            ),
            subtitle: Text(
              "Hello",
              style: grSText,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
            title: Text(
              "Kaan Avcı",
              style: grSTextB,
            ),
            trailing: Text("4m ago",
                style:
                    grTertiary.copyWith(color: EmbabedUtility.socialLightGray)),
            isThreeLine: true,
          ),
        ],
      ),
    );
  }
}
