import 'package:flutter/material.dart';
import 'package:psikoz/controller/general_control_controller.dart';
import 'package:psikoz/core/components/iconWidget/leading_widget.dart';
import 'package:psikoz/core/components/inputbar/search_bar_widget.dart';
import 'package:psikoz/core/components/seperators/seperators_line.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/global/dio_instance.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';

import 'package:get/get.dart';
import 'package:psikoz/product/service/service/dio_service_db.dart';

import '../../../product/init/theme/text_theme.dart';
import 'message_detail_view.dart';

class GeneralControlView extends GetView<GeneralControlController> {
  const GeneralControlView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
        GeneralControlController(DioServiceDb(DioInstanceTsApi.instance.dio)));
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: const LeadingWidget(),
          centerTitle: true,
          actions: const [SettingsWidget()],
          title: Text(
            "Gönderiler ve Seanslar",
            style: Get.textTheme.bodyLarge,
          ),
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicator: UnderlineTabIndicator(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 1,
                    color: EmbabedUtility.socialPurple,
                  )),
              automaticIndicatorColorAdjustment: true,
              indicatorColor: EmbabedUtility.socialPurple,
              tabs: [
                Text(
                  "Gönderilerim",
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Geçmiş Seanslarım",
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Planlanmış Seanslarım",
                  textAlign: TextAlign.center,
                )
              ],
              controller: controller.generalControl),
        ),
        body: TabBarView(
          children: [
            Container(color: Colors.green,), Container(color: Colors.pink,), Container(color: Colors.purple,)
          ],
          controller: controller.generalControl,
          clipBehavior: Clip.none,
        ));
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
