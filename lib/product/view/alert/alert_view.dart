import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';

import '../../../core/init/theme/text_theme.dart';
class AlertView extends StatelessWidget {
  const AlertView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,title: Text("Bildirimler ",style: grTextB.copyWith(color: Colors.white)),actions: [

        Padding(
          padding: const EdgeInsets.only(right:10.0),
          child: Center(child: Text("Bütün hepsini oku",style: grSTextB.copyWith(color: EmbabedUtility.socialPink))),
        )
      ],),

      body: Column(
        children: [

          ListTile(title: Text("Ahmet_32,cafer_38 paylaştığınız postu beğendi"),
          subtitle: Text("10 dakika önce"),leading: CircleAvatar(backgroundColor: EmbabedUtility.socialLightGray,child: IconNames.like.tosvgPictureConvert(EmbabedUtility.socialblue))),
        ],
      ),
    );
  }
}