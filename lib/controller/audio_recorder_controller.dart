import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AudioRecorderController extends GetxController {
  late final RecorderController recorderController;

  String? path;
  var musicFile = "".obs;
  var isRecording = false.obs;
  var isRecordingCompleted = false.obs;
  var isLoading = true.obs;
  late Directory appDirectory;

  void initilazeRecorder() {
    recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 44100;
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      musicFile.value = result.files.single.path ?? "";
      update();
    }
  }

  Future<void> getDir() async {
    appDirectory = await getApplicationDocumentsDirectory();
    path = "${appDirectory.path}/recording.m4a";
    print(path);
    update();
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getDir();
    initilazeRecorder();
  }

  Future<void> startRecording() async {
    try {
      if (isRecording.value) {
        recorderController.reset();

        final path = await recorderController.stop(false);

        if (path != null) {
          isRecordingCompleted.toggle();
          debugPrint(path);
          debugPrint("Recorded file size: ${File(path).lengthSync()}");
        }
      } else {
        print("kayıt başladı");

        await recorderController.record(path: path!);
        isRecording.toggle();
        update();
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isRecording.toggle();
    }
  }

  void refreshHawe() {
    if (isRecording.value) {
      recorderController.refresh();
    }
  }
}
