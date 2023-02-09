import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/components/post/post_bar.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';

class HomeViewDoctor extends StatelessWidget {
  const HomeViewDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Günaydın Doktor Selin", style: Get.textTheme.labelMedium),
      ),
      body: Column(children: [
        PostBar(() {}, () {
          Get.defaultDialog(
              titleStyle: Get.textTheme.bodyMedium,
              title: "Kullanıcı bilgileri",
              radius: 10,
              backgroundColor: EmbabedUtility.darkBlack,
              content: Column(
                children: [
                  longPressRow("İsim: ", "Ahmet"),
                  longPressRow("Yaş: ", "24"),
                  longPressRow("Cinsiyet: ", "Erkek"),
                ],
              ));
        }, () {},
            text:
                """Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.3""",
            userName: "userName",
            time: "time",
            category: "category")
      ]),
    );
  }

  Widget longPressRow(String first, String second) {
    return Row(
      children: [Text(first), Text(second)],
    );
  }
}
