import 'package:flutter/material.dart';
import 'package:psikoz/core/components/iconWidget/leading_widget.dart';
import 'package:psikoz/core/components/inputbar/search_bar_widget.dart';
import 'package:psikoz/core/components/seperators/seperators_line.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';


import 'package:get/get.dart';

import '../../../product/init/theme/text_theme.dart';
import 'message_detail_view.dart';

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
         const  Padding(
            padding: const EdgeInsets.only(left: 20.0,right:20,bottom: 15),
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
                style: grTertiary.copyWith(
                    color: EmbabedUtility.socialLightGray)),isThreeLine: true,
          ),
          
        ],
      ),
    );
  }
}
