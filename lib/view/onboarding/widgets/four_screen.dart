import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/utility/app/scroll_pyhcis_utility.dart';

class FourScreen extends StatelessWidget {
  const FourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return sc2();
  }

  SizedBox sc2() {
    return SizedBox(
      // height: Get.height,
      child: Column(
        children: [
          Text(
            "Lütfen ilgi alanlarınızı seçiniz",
            style: Get.textTheme.displaySmall,
          ),
          SizedBox(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const ScrollPyhcisyUtilty.bouncAlways(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5
                  //,mainAxisExtent: 1
                  ),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                     color: Colors.blue,
                  ),
                 
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget sc() {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Text(
            "Lütfen ilgi alanlarınızı seçiniz",
            style: Get.textTheme.displaySmall,
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              color: Colors.blue,
            );
          }),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
        )
      ],
    );
  }
}
