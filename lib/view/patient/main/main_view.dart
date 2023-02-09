import 'package:flutter/material.dart';
import 'package:psikoz/core/components/bottomNavigation/bottom_navigation.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/product/init/routes/pages.dart';
import 'package:psikoz/controller/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Obx(() => pages[controller.selectedItem.value]),
        bottomNavigationBar:bottomNavi());
  }

  Widget bottomNavi() {
    return Obx(() => BottomNavigatior(
          selectedItem: controller.selectedItem.value,
          onTap: () => controller.selectedItem.value = 0,
          onTap1: () => controller.selectedItem.value = 1,
          onTap2: () => controller.selectedItem.value = 2,
        ));
  }
}
