import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/constants/app/app_constant.dart';

import '../../../controller/onboarding/register_controller.dart';
import '../../../core/constants/app/app_array_constant.dart';
import '../../../core/constants/app/app_size_constant.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Obx(() => DropdownButtonHideUnderline(
              child: DropdownButton(
                  hint: Text(
                    controller.gender.value == ""
                        ? AppConstant.registerGenderText
                        : controller.gender.value.toString().contains("1")
                            ? AppConstant.registerMaleText
                            : AppConstant.registerFemaleText,
                            style: Get.textTheme.bodyMedium,
                  ),
                  elevation: AppSizeConstant.elevation8.toInt(),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  items:  [
                    DropdownMenuItem(
                      value: "1",
                      child: Text(AppConstant.registerMaleText, style: Get.textTheme.bodyMedium,),
                    ),
                    DropdownMenuItem(
                      value: "2",
                      child: Text(
                        AppConstant.registerFemaleText, style: Get.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    controller.gender.value = value ?? "1";
                  }),
            )),
        Obx(() => DropdownButtonHideUnderline(
              child: DropdownButton(
                  elevation: AppSizeConstant.elevation8.toInt(),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  hint: Text(controller.age.value == 1
                      ? "Yaş"
                      : controller.age.value.toString(), style: Get.textTheme.bodyMedium,),
                  items: AppArrayConstant.ageClass
                      .map((e) => DropdownMenuItem<int>(
                          value: e, child: Text(e.toString())))
                      .toList(),
                  onChanged: (value) {
                    controller.age.value = value ?? 21;
                  }),
            )),
      ],
    );
  }
}
