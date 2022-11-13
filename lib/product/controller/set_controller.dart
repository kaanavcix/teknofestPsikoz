import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';

class SetController extends GetxController {
  var imagePicker = ImagePicker();
  Rx<XFile?> selectedImage = Rx<XFile?>(null);
  
  var imageCropper = ImageCropper();
  var cropImagePathProfile = "".obs;
  var cropImagePathBackground = " ".obs;
  var androidUiSettings = AndroidUiSettings(
              statusBarColor: EmbabedUtility.socialGray,
              toolbarTitle: "Fotoğrafı düzenle",
             // toolbarColor: EmbabedUtility.socialGray,
             dimmedLayerColor: EmbabedUtility.socialGray,
             // toolbarWidgetColor: EmbabedUtility.socialLightGray,
              backgroundColor: EmbabedUtility.socialGray,
              //cropFrameColor: EmbabedUtility.socialPink,
             // hideBottomControls: true,
              activeControlsWidgetColor: EmbabedUtility.socialblue,



            );

  Future<void> getProfileImage(ImageSource imageSource) async {
    final XFile? pickedFile = await imagePicker.pickImage(source: imageSource);

    if (pickedFile != null) {
      selectedImage.value = pickedFile;

      
      final cropImageFile = await imageCropper.cropImage(
          sourcePath: selectedImage.value!.path,
          maxHeight: 512,
          maxWidth: 512,
         // cropStyle: CropStyle.circle,

          uiSettings: [
            androidUiSettings
          ]);

      cropImagePathProfile.value = cropImageFile!.path;

      print(pickedFile.path.toString());
      setProfilePhoto(cropImagePathProfile.value);
    } else {
      Get.snackbar("Problem", "ERROR");
    }
  }

  Future<void> setProfilePhoto(String path) async {
   // var mediaUrl =
   //     await stroage.uploadProfilePhoto(File(path), auth.currentUser!.uid);

   // db
     //   .collection("users")
       // .doc(auth.currentUser!.uid)
        //.set({"profileUrl": mediaUrl}, SetOptions(merge: true));
  }

  Future<void> getProfileBackground(ImageSource imageSource) async {
    final XFile? pickedFile = await imagePicker.pickImage(source: imageSource);

    if (pickedFile != null) {
      selectedImage.value = pickedFile;
      final cropImageFile = await imageCropper.cropImage(
          sourcePath: selectedImage.value!.path,
          maxHeight: 200,
          
          
          uiSettings: [
            androidUiSettings
          ]);

      cropImagePathBackground.value = cropImageFile!.path;


      print(pickedFile.path.toString());
      setProfileBackground(cropImagePathBackground.value);
    } else {
      Get.snackbar("Problem", "ERROR");
    }
  }

  Future<void> setProfileBackground(String path) async {
  //  var mediaUrl = await stroage.uploadProfilePhoto(
    //    File(path), auth.currentUser!.uid);

    //db
      //  .collection("users")
        //.doc(auth.currentUser!.uid)
        //.set({"backgroundProfileUrl": mediaUrl}, SetOptions(merge: true));
  }
}
