import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/utility/app/sized_box_dummy.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: EmbabedUtility.socialGray,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_rounded,
                color: Colors.white,
              ),
            )
          ],
          automaticallyImplyLeading: false,
          leading: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: const Text("Randevu  Seçimi")),
      body: Column(
        children: [
          topBar(),
          const SizedBoxDummy.height(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Mart 2019",
                style: Get.textTheme.displayMedium?.copyWith(fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: 100,
            width: Get.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              children: [
                daysSquare("13", "Pazartesi", true),
                daysSquare("14", "Salı", false),
                daysSquare("15", "Çarşamba", false),
                daysSquare("16", "Perşembe", false),
                daysSquare("17", "Cuma", false),
                daysSquare("18", "Cumartesi", false),
                daysSquare("19", "Pazar", false)
              ],
            ),
          ),
          Column(
            children: [
              Text("Sabah",
                  style: Get.textTheme.displayMedium?.copyWith(fontSize: 18)),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                runAlignment: WrapAlignment.spaceBetween,
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  timeBar("8.30", false, false),
                  timeBar("9.30", true, false),
                  timeBar("10.30", true, false),
                  timeBar("11.30", false, false),
                  timeBar("12.30", false, true),
                  timeBar("13.30", false, false),
                ],
              ),
              SizedBoxDummy.height(
                height: 50,
              ),
              Text("Akşam",
                  style: Get.textTheme.displayMedium?.copyWith(fontSize: 18)),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                runAlignment: WrapAlignment.spaceBetween,
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  timeBar("14.30", false, false),
                  timeBar("15.30", true, false),
                  timeBar("16.30", true, false),
                  timeBar("17.30", false, false),
                  timeBar("18.30", false, true),
                  timeBar("19.30", false, false),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Container timeBar(String text, bool isFull, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected
              ? EmbabedUtility.socialPurple
              : (isFull
                  ? EmbabedUtility.socialblue
                  : Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.timelapse_rounded,
              color: Colors.white,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }

  Widget daysSquare(String day, String name, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected
              ? EmbabedUtility.socialblue
              : Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(13)),
      margin: const EdgeInsets.all(8),
      width: 80,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            name,
            style: Get.textTheme.displayLarge,
          ),
          Text(day, style: Get.textTheme.headlineMedium)
        ],
      ),
    );
  }

  Widget topBar() {
    return Container(
        height: 200,
        width: Get.width,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
            boxShadow: [BoxShadow(offset: Offset(1, -1))],
            color: EmbabedUtility.socialGray),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          const SizedBoxDummy.width(
            width: 20,
          ),
          Container(
            height: 120,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.black,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://picsum.photos/200/300",
                    )),
                borderRadius: BorderRadius.circular(20)),
          ),
          const SizedBoxDummy.width(
            width: 30,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Doktor ismi",
                style: Get.textTheme.displaySmall,
              ),
              const SizedBoxDummy.height(
                height: 15,
              ),
              const Text(
                "Doktor alanı",
              ),
              const SizedBoxDummy.height(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.star_border,
                    color: Colors.white,
                  ),
                  Text("5.0 ")
                ],
              )
            ],
          )
        ]));
  }
}
