import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/components/iconWidget/leading_widget.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/utility/app/sized_box_dummy.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/product/init/theme/text_theme.dart';

class MyMaterialView extends StatelessWidget {
  MyMaterialView({super.key});

  @override
  Widget build(BuildContext context) {
    var edgeInsets = const EdgeInsets.only(right: 10, left: 10);
    return Scaffold(
      appBar: AppBar(
        actions: actions(edgeInsets),
        leading: leading(),
        title: title(),
      ),
      body: Column(
        children: [
          const SizedBoxDummy.height(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              materialsButton("Podcastlerim", null, Colors.white),
              materialsButton(
                  "Yazılarım", EmbabedUtility.socialPurple, Colors.transparent),
            ],
          ),
          const SizedBoxDummy.height(height: 10),
          ListTile(
            title: const Text("Psikolojik Yansımalar"),
            subtitle: Row(
              children: [
                Text(
                  "10:31 dk",
                  style: grSTextB.copyWith(color: EmbabedUtility.socialPurple),
                ),
                
              ],
            ),
            leading: IconNames.waveform
                .tosvgPictureConvert(null, height: 48, width: 48),
          )
        ],
      ),
    );
  }

  Text title() => Text("Materyallerim", style: grTextB);

  GestureDetector leading() {
    return GestureDetector(
      child: const Icon(Icons.arrow_back, color: Colors.white),
      onTap: () {
        Get.back();
      },
    );
  }

  List<Widget> actions(EdgeInsets edgeInsets) {
    return [
      const Icon(
        Icons.mic,
        color: Colors.white,
      ),
      Padding(
        padding: edgeInsets + const EdgeInsets.only(right: -10),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      Padding(
          padding: edgeInsets, child: IconNames.email.tosvgPictureConvert(null))
    ];
  }

  Widget materialsButton(String text, Color? color, Color radiusColor) {
    return Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
              color: radiusColor, width: 1, style: BorderStyle.solid)),
      child: Center(
          child: Text(
        text,
        style: grSTextB,
      )),
    );
  }
}
