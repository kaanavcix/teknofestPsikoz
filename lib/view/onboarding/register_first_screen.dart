import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/utility/app/padding_utility.dart';
import 'package:psikoz/view/onboarding/register_view.dart';
import 'package:psikoz/view/onboarding/register_view_doctor.dart';
import 'package:psikoz/view/onboarding/widgets/first_screen.dart';

class RegisterFirstView extends StatelessWidget {
  const RegisterFirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Kayıt ol",
            style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white)),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: PaddinUtilty.topPadding(60.0).padding,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    height: 100,
                    width: 100,
                    "assets/images/logo.svg",
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: PaddinUtilty.topPadding(150.0).padding,
                child: button("Kullanıcı kayıt ol", Icons.person),
              ),
              button("Psikolog kayıt ol", Icons.account_circle_rounded),
              const Spacer(),
              Padding(
                padding: PaddinUtilty.bottomPadding(height: 15).padding,
                child: Text(
                  "Powered by bexbow ",
                  style: Get.textTheme.bodyLarge,
                ),
              )
            ]),
      ),
    );
  }

  Widget button(String text, IconData? icon) {
    return OutlinedButton.icon(
      onPressed: () {
        if (text.contains("Kullanıcı")) {
          Get.toNamed("/register");
        } else if (text.contains("Psikolog")) {
          Get.toNamed("/doctorRegister");
        }
      },
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(
        text,
        style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white),
      ),
      style: OutlinedButton.styleFrom(
        shape:
            const StadiumBorder(side: BorderSide(color: Colors.blue, width: 1)),
      ),
    );
  }
}
