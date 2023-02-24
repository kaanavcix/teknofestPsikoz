import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/controller/onboarding/onboard_controller.dart';
import 'package:psikoz/core/utility/app/padding_utility.dart';
import 'package:psikoz/core/utility/app/sized_box_dummy.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/view/onboarding/login_view._new.dart';
import 'package:psikoz/view/onboarding/login_view.dart';
import 'package:psikoz/view/onboarding/register_first_screen.dart';
import 'package:psikoz/view/onboarding/widgets/psikoz_button_widget.dart';

import '../../product/view/horizontal_or_divider.dart';

class LoginViewNewDesign extends GetView<OnboardingController> {
  LoginViewNewDesign({super.key});

  List<String> url = [
    "assets/images/onboard.png",
    "assets/images/logo.png",
    "assets/images/onboard.png",
    "assets/images/logo.png"
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 7,
              child: PageView.builder(
                controller: controller.pageController,
                pageSnapping: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                      child: Image.asset(
                        url[index],
                        fit: BoxFit.cover,
                      ));
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 88, 37, 216),
                          shape: CircleBorder()),
                      onPressed: () {
                        controller.pageController.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear);
                      },
                      child: const Icon(
                        Icons.keyboard_double_arrow_left,
                        color: Colors.white,
                        // textDirection: TextDirection.ltr,{}
                      )),
                  ...url
                      .map<Widget>((e) => DotLine(
                          isIndex: false
                          ))
                      .toList(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: EmbabedUtility.socialLightGray,
                          shape: CircleBorder()),
                      onPressed: () {
                        if (url.length == controller.pageController.page) {
                          null;
                        } else {
                          controller.pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.linear);
                        }
                      },
                      child: const Icon(
                        Icons.keyboard_double_arrow_right,
                        color: Colors.white,
                        //  textDirection: TextDirection.rtl,
                      )),
                ],
              ),
            ),
            middlebar(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text("Bexbow Inc"),
            )
          ],
        ),
      ),
    );
  }

  Widget middlebar() {
    return Padding(
      padding: PaddinUtilty.horizontalPadding(
        height: 8,
      ).padding,
      child: Expanded(
        flex: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBoxDummy.height(height: 50),
            PsikozGradientButton(
                onTap: () => Get.to(
                      LoginView(),
                    ),
                text: "Giriş Yap"),
            const SizedBoxDummy.height(height: 10),
            const HorizontalOrLine(height: 0.5, label: "Ya da"),
            const SizedBoxDummy.height(height: 10),
            PsikozOnboardButton(
                onTap: () => Get.to(RegisterFirstView()), text: "Kayıt Ol"),
          ],
        ),
      ),
    );
  }
}

class DotLine extends StatelessWidget {
  DotLine({super.key, required this.isIndex});

  

  bool isIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: isIndex?16: 12,
        width: isIndex?6: 4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color:  EmbabedUtility.socialLightGray),
      ),
    );
  }
}
