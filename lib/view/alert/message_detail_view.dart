import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/components/iconWidget/leading_widget.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';

class MessageDetailView extends StatelessWidget {
  const MessageDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: LeadingWidget(),
          title: Text(
            "Kaan Elpas",
            style: Get.textTheme.bodyMedium,
          ),
          centerTitle: true,
          actions: const [
            Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.photo_camera_front,
                  color: Colors.black,
                ))
          ],
        ),
        body: Center(
            child: Row(children: [
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white30,
                  ),
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextField(
                          decoration: InputDecoration(
                        hintText: "Please Write Here :::..",
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ))))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                  onTap: () async {
                    //debugPrint(widget.chatModel.docId.toString());
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: const Icon(
                    Icons.send,
                    size: 28,
                  )))
        ])));
  }
}
