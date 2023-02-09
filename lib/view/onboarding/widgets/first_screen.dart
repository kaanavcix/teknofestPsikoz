import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding/register_controller.dart';
import '../../../core/components/inputbar/psikoztextbar.dart';

class FirstScreen extends GetView<RegisterController> {
   const FirstScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "İsminizi ve kullanıcı adınızı giriniz",
          style: Get.textTheme.headlineLarge,
        ),
        Padding(
            padding: const EdgeInsets.only(top: 3, bottom: 10),
            child: PsikozTextBar(
              hintText: "İsminiz",
              keyboardType: TextInputType.text,
              //textInputAction: TextInputAction.continueAction,
              textcontroller: controller.nameController,
              prefixIcon: const Icon(Icons.person, size: 18,color: Colors.white,),
            )),
        Padding(
            padding: const EdgeInsets.only(top: 3, bottom: 20,),
            child: PsikozTextBar(
              hintText: "Kullanıcı Adınız",
              keyboardType: TextInputType.text,
              textcontroller: controller.usernameController,
              prefixIcon: const Icon(Icons.person, size: 20,color: Colors.white,),
            )),
              Padding(
            padding: const EdgeInsets.only(top: 3, bottom: 20,),
            child: PsikozTextBar(
              onTap: () =>DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(2002, 01, 01),
                              maxTime: DateTime.now(), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            print('confirm $date');  //!!! I WİLL ADJUST
                          }, currentTime: DateTime.now(), locale: LocaleType.tr)
    ,
              hintText: "Doğum Tarihi",
              
              prefixIcon: const Icon(Icons.date_range, size: 20,color: Colors.white,),
            )),
      ],
    );
  }
  AutovalidateMode validateMode() {
    return (controller.isFailed.value
        ? AutovalidateMode.always
        : AutovalidateMode.disabled);
  }
}
