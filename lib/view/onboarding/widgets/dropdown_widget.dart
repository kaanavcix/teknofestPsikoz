import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                
                hint:Text(controller.gender.value == ""
                      ? "Cinsiyet"
                      : controller.gender.value.toString()) ,
                  elevation: AppSizeConstant.elevation8.toInt(),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  items: const [
                    DropdownMenuItem(
                      value: "1",
                      child: Text("Erkek"),
                    ),
                    DropdownMenuItem(
                      value: "2",
                      child: Text(
                        "Kadın",
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
                      : controller.age.value.toString()),
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
