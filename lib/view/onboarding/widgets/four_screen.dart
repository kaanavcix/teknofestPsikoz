import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/constants/app/app_array_constant.dart';
import 'package:psikoz/core/constants/app/app_constant.dart';
import 'package:psikoz/core/constants/app/app_size_constant.dart';
import 'package:psikoz/core/utility/app/scroll_pyhcis_utility.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';

import '../../../controller/onboarding/register_controller.dart';
import 'dropdown_widget.dart';

class FourScreen extends GetView<RegisterController> {
  const FourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return sc2();
  }

  SizedBox sc2() {
    var data = "Lütfen ilgi alanlarınızı seçiniz";
    var data2 = "Lütfen yaşınız ve cinsiyetinizi seçiniz";
    

    return SizedBox(
      // height: Get.height,
      child: Column(
        children: [
          Text(
            "",
            style: Get.textTheme.displaySmall,
          ),
          DropdownWidget(controller: controller,),
          Obx(() => Column(
                children: [
                  CheckboxListTile(
                    activeColor: EmbabedUtility.socialblue,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    value: controller.kvkkform.value,
                    onChanged: (value) {
                      controller.kvkkform.value = value ?? false;
                    },
                    title: const Text("KVKKK FORMU "),
                  ),
                  CheckboxListTile(
                    activeColor: EmbabedUtility.socialblue,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    value: controller.onamform.value,
                    onChanged: (value) {
                      controller.onamform.value = value ?? false;
                    },
                    title: Text("KİŞİ ONAM FORMU FORMU "),
                  ),
                  CheckboxListTile(
                    activeColor: EmbabedUtility.socialblue,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    value: controller.secretform.value,
                    onChanged: (value) {
                      controller.secretform.value = value ?? false;
                    },
                    title: Text("GİZLİLİK SÖZLEŞME FORMU "),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget hobbiesBar() {
    return SizedBox(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const ScrollPyhcisyUtilty.bouncAlways(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5
            //,mainAxisExtent: 1
            ),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
            ),
          );
        },
      ),
    );
  }

  Widget sc() {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Text(
            "Lütfen ilgi alanlarınızı seçiniz",
            style: Get.textTheme.displaySmall,
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              color: Colors.blue,
            );
          }),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
        )
      ],
    );
  }
}

