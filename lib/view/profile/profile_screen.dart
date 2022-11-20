import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "Profile",
            style: Get.textTheme.bodyMedium,
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: IconNames.dotsvertical.tosvgPictureConvert(null))
        ],
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Card(
            elevation:0.4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            
            color: Colors.transparent,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 255, 255, 255)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue),
                        ),
                        Column(
                          children: [Text("data"), Text("data"), Text("data")],
                        )
                      ],
                    ),
                    Text(
                        "sddnfmkdslfsdafasdfkadsfmksdafmksdafmksdafmksdafsdkafd")
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
