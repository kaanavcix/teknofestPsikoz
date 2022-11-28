import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/constants/app/app_constant.dart';
import 'package:psikoz/core/utility/app/padding_utility.dart';

import '../../../controller/onboarding/register_controller.dart';
import '../../../core/components/inputbar/psikoztextbar.dart';
import '../../../core/constants/enums/Icon-enums.dart';

class SecondScreen extends GetView<RegisterController> {
  const SecondScreen({super.key});


  @override
  Widget build(BuildContext context) {
    const edgeInsets =  EdgeInsets.only(top: 3, bottom: 10);
    return Form(
      key: controller.formState,
      autovalidateMode: validateMode() ,
      child: Column(
        children: [
          Text(
            AppConstant.registerEmailTitle, 
            style: Get.textTheme.headlineLarge,
          ),
          Padding(
              padding: edgeInsets,
              child: PsikozTextBar(
                  hintText: AppConstant.emailHintText,
                  keyboardType: TextInputType.emailAddress,
                  //textInputAction: TextInputAction.continueAction,
                  textcontroller: controller.emailController,
                  prefixIcon: Padding(
                      padding: PaddinUtilty.normalPadding(padding: 15).padding,
                      child: IconNames.email
                          .tosvgPictureConvert(null, height: 12, width: 12)))),
        ],
      ),
    );
  }
  AutovalidateMode validateMode() {
    return (controller.isFailed.value
        ? AutovalidateMode.always
        : AutovalidateMode.disabled);
  }
}