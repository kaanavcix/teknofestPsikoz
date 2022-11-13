import 'package:flutter/material.dart';
import 'package:psikoz/core/components/iconWidget/leading_widget.dart';
import 'package:psikoz/core/components/inputbar/search_bar_widget.dart';
import 'package:psikoz/core/components/seperators/seperators_line.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';

import '../../../core/init/theme/text_theme.dart';

import 'package:get/get.dart';

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
          style: grSTextB.copyWith(color: Colors.white, letterSpacing: 0.9),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0,right:20,bottom: 15),
            child: SearchBarWidget(),
          ),
         
          MySeparator(
            color: EmbabedUtility.socialLightGray,
            height: 1,
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
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
