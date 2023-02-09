import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/constants/app/app_size_constant.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/view/doctor/profile/my_material_view.dart';
import 'package:psikoz/view/doctor/profile/settings_view.dart';
import 'package:psikoz/view/patient/profile/settings_view.dart';
import '../../../core/utility/app/sized_box_dummy.dart';

class ProfileViewDoctor extends StatelessWidget {
  const ProfileViewDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          profileStack(),
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 150,
            child: textColumn(),
          ),
          Column(
            children: [
              GestureDetector(
                  onTap: () {
                    Get.to(MyMaterialView());
                  },
                  child: profileButtons(Icon(Icons.star), "Materyallerim")),
              profileButtons(Icon(Icons.star), "Randevularım"),
              profileButtons(Icon(Icons.star), "Cevap Verdiklerim"),
              profileButtons(Icon(Icons.star), "Ödemeler")
            ],
          )
        ]),
      ),
    );
  }

  Padding profileButtons(Icon icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Card(
          elevation: AppSizeConstant.elevation8,
          color: EmbabedUtility.darkBlack,
          child: Container(
            height: 50,
            width: Get.width,
            child: Row(children: [
              icon,
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(text),
              )
            ]),
          )),
    );
  }

  Widget profileStack() {
    var borderRadius3 = BorderRadius.circular(22);
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        ClipPath(
          clipper: ClipPathClass(),
          child: Container(
            decoration: const BoxDecoration(

                //  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://loremflickr.com/640/360"))),
            height: 150,
          ),
        ),
        Positioned(
          top: 0,
          bottom: -150,
          right: 0,
          left: 0,
          child: Align(
              alignment: Alignment.center,
              child: imageContainer(borderRadius3)),
        ),
        Positioned(
            top: 3,
            right: 8,
            child: IconButton(
                onPressed: () => Get.to(SettingViewDoctor()),
                icon: const Icon(
                  Icons.more_horiz_outlined,
                )))
      ],
    );
  }

  Widget profileCard() {
    var borderRadius3 = BorderRadius.circular(22);

    return Card(
      elevation: AppSizeConstant.elevation8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: EmbabedUtility.darkBlack),
        height: 200,
        child: Column(children: [imageContainer(borderRadius3), textColumn()]),
      ),
    );
  }
}

Widget textColumn() {
  return Column(
    children: [
      Text(
        "Ahmet Delikanlı",
        style: Get.textTheme.bodyMedium?.copyWith(letterSpacing: 0.5),
      ),
      const SizedBoxDummy.height(),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              "@bex",
              style: Get.textTheme.headlineLarge
                  ?.copyWith(color: EmbabedUtility.socialblue),
            ),
          ),
          Text(
            "Doktor",
            style: Get.textTheme.headlineMedium,
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 3),
        child: Text(
          "Hello my name is bex I am interested very exactly psyhcology techology",
          textAlign: TextAlign.center,
          style: Get.textTheme.headlineLarge,
        ),
      ),
    ],
  );
}

Widget imageContainer(BorderRadius borderRadius3) {
  return Card(
    elevation: 800,
    shape: const CircleBorder(),
    child: Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://placebear.com/640/360",
              )),
          color: Colors.blue),
    ),
  );
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
