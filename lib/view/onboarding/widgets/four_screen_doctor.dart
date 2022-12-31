import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/view/onboarding/widgets/dropdown_widget.dart';

import '../../../controller/onboarding/register_controller.dart';

class FourScreenDoctor extends GetView<RegisterController> {
  const FourScreenDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownWidget(controller: controller),
        ElevatedButton.icon(
          icon: const Icon(
            Icons.upload_file,
            color: Colors.white,
          ),
          label: const Text(
            "Dosya yükleme",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ["pdf"],
                onFileLoading: (p0) {
                  print(p0);
                },
                withData: true,
                dialogTitle: "Lütfen ilgili pdf dosyasını seçiniz");

            if (result != null) {
              PlatformFile file = result.files.first;

              controller.file.value = File(file.path ?? "");
              controller.fileName.value = file.name;
              //!!!  working right now controller obs class

              print("path" + controller.file.value.path);
              print("name" + controller.fileName.value);
            } else {
              // User canceled the picker

            }
          },
        )
      ],
    );
  }
}



