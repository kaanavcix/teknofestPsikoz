import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utility/embabed/embabed_utility.dart';

class LoginViewNew extends StatelessWidget {
  const LoginViewNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Placeholder(
          fallbackWidth: Get.width,
          fallbackHeight: 100,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Psi",
                style: Get.textTheme.displaySmall!.copyWith(
                    color: EmbabedUtility.socialwhite,
                    fontWeight: FontWeight.bold)),
            Text(
              "koz",
              style: Get.textTheme.displaySmall!.copyWith(
                  color: EmbabedUtility.socialPurple,
                  fontWeight: FontWeight.bold),
            ),

            
          ],
        ),TextFormField(
              decoration: InputDecoration(
                 alignLabelWithHint: true,contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                 

                filled: true,
                focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(80),
                borderSide:BorderSide(
                  color: EmbabedUtility.socialblue,
                  width: 1,
                )),

                constraints: BoxConstraints(maxHeight: 46,maxWidth: Get.width*0.9,minHeight: 46,minWidth: Get.width*0.9
                )
                ,fillColor: EmbabedUtility.scaffoaldBackgorund,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(80),
                borderSide:BorderSide(
                  color: EmbabedUtility.socialGray,
                  width: 1,
                
                )
              )),
            )
      ]),
    );
  }
}
