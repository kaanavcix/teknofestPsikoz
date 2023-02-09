import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/controller/audio_recorder_controller.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'dart:ui' as ui show Gradient;

import 'package:psikoz/view/doctor/material/wave_rbubble.dart';

class AudioRecorderView extends GetView<AudioRecorderController> {
  const AudioRecorderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AudioRecorderController());
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              color: Colors.white,
              icon: const Icon(Icons.arrow_back)),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: IconNames.attachment.tosvgPictureConvert(null))
          ],
          title: Text(
            "Podcast Kayıt",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontSize: 16, color: Colors.white),
          )),
      body: Obx(()=>Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: controller.isRecording.value
                      ? AudioWaveforms(
                          enableGesture: true,
                          size: Size(MediaQuery.of(context).size.width / 2, 50),
                          recorderController: controller.recorderController,
                          waveStyle: const WaveStyle(
                            waveColor: Colors.white,
                            extendWaveform: true,
                            showMiddleLine: false,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: const Color(0xFF1E1B26),
                          ),
                          padding: const EdgeInsets.only(left: 18),
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                        )
                      : Container(
                          child: Text("Lütfen bişiler kaydedin"),
                        )),
              IconButton(
                  onPressed: ()async =>await controller.startRecording() ,
                  icon: Icon(
                      controller.isRecording.value ? Icons.stop : Icons.mic))
            ]),
      ),)
    );
  }
}
