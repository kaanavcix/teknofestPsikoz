import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/controller/main_doctor_controller.dart';
import 'package:psikoz/view/doctor/material/material_view.dart';
import 'package:psikoz/view/patient/home/home_view..dart';
import 'package:psikoz/view/patient/profile/profile_view.dart';

import '../../../core/components/bottomNavigation/bottom_navigation.dart';
import '../../../product/init/routes/pages.dart';

class MainViewDoctor extends GetView<MainDoctorController> {
  MainViewDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainDoctorController());
    return GetBuilder<MainDoctorController>(
      builder: (_) {
        return Scaffold(
            body: doctorPages[controller.selectedIndex.value],
            bottomNavigationBar: BottomNavigatior(
              selectedItem: controller.selectedIndex.value,
              onTap:() => controller.updateIndex(0),
              onTap1:()=> controller.updateIndex(1),
onTap2: ()=>controller.updateIndex(2),
            ));
      },
    );
  }
}
