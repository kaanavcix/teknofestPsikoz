import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/init/theme/text_theme.dart';
import 'package:psikoz/core/service/firebase/firebase_db.dart';
import 'package:psikoz/core/utility/app/sizedbox_utility.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/product/controller/profile_controller.dart';
import 'package:psikoz/product/controller/set_controller.dart';
import 'package:psikoz/view/profile/settings_view.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    var stroage = Get.put(SetController());
    var db = Get.find<FirebaseDb>();
    var radius2 = 70.0;
    return Scaffold(
      body: Column(
        children: [
          Stack(clipBehavior: Clip.none, children: [
            GestureDetector(
              onTap: () => Get.bottomSheet(bottomsheet(
                stroage,
                () => stroage
                    .getProfileBackground(ImageSource.camera)
                    .then((value) => Get.back()),
                () => stroage
                    .getProfileImage(ImageSource.gallery)
                    .then((value) => Get.back()),
              )),
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                    color: Colors.green.shade300,
                    image: db.user.first.backgroundImage == ""
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(db.user.first.backgroundImage ??
                                "https://picsum.photos/200/300"))
                        : null),
              ),
            ),
            Positioned(
                right: 0,
                top: 160 / 10,
                child: IconButton(
                    onPressed: () => Get.to(SettingsView()),
                    icon: IconNames.settings.tosvgPictureConvert(
                        EmbabedUtility.socialLightGray,
                        height: 24,
                        width: 24))),
            Positioned(
                left: 0,
                right: 0,
                bottom: -70,
                child: GestureDetector(
                  onTap: () => Get.bottomSheet(
                    bottomsheet(
                      stroage,
                      () => stroage
                          .getProfileImage(ImageSource.camera)
                          .then((value) => Get.back()),
                      () => stroage
                          .getProfileBackground(ImageSource.gallery)
                          .then((value) => Get.back()),
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue.shade800,
                    backgroundImage: db.user.first.image == ""
                        ? NetworkImage(
                            db.user.first.image ??
                                "https://picsum.photos/200/300",
                          )
                        : null,
                    radius: radius2,
                  ),
                )),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  db.user.first.username.toString(),
                  style: grTextB,
                ),
                SizedUtility.sizedBox5,
                Text(
                  db.user.first.claimsName.toString(),
                  style:
                      grSText.copyWith(color: EmbabedUtility.socialLightGray),
                ),
                SizedUtility.sizedBox5,
                Text(db.user.first.description.toString()),
                db.user.first.claimsId == "1"
                    ? SizedBox()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                db.user.first.follow!.length.toString(),
                                style: grSText,
                              ),
                              Text(
                                "Fallowers",
                                style: grSText.copyWith(
                                    color: EmbabedUtility.socialLightGray),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                db.user.first.follow!.length.toString(),
                                style: grSText,
                              ),
                              Text(
                                "Fallowing",
                                style: grSText.copyWith(
                                    color: EmbabedUtility.socialLightGray),
                              ),
                            ],
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                shape: const StadiumBorder(
                                    side: BorderSide(color: Colors.white)),
                                elevation: 0,
                              ),
                              onPressed: () async {},
                              child: Text(
                                "Takip et",
                                style: grSTextB.copyWith(color: Colors.white),
                              ))
                        ],
                      ),
                TabBar(
                    indicatorColor: EmbabedUtility.socialblue,
                    // indicator: UnderlineTabIndicator(borderSide: BorderSide()),
                    indicatorWeight: 4.0,
                    indicatorPadding: EdgeInsets.all(8),
                    controller: controller.tabController,
                    tabs: [
                      Tab(
                        text: "Post",
                      ),
                      Tab(
                        text: "Anonim",
                      ),
                      Tab(
                        text: "Liked",
                      ),
                      Tab(
                        text: "Tagges",
                      )
                    ])
              ],
            ),
          )
        ],
      ),
    );
  }

  Container bottomsheet(SetController stroage, void Function()? onTapCamera,
      void Function()? onTapGallery) {
    return Container(
        color: Colors.black,
        height: Get.height * 0.2,
        child: Column(children: [
          ListTile(
            onTap: onTapCamera,
            leading: IconNames.camera.tosvgPictureConvert(
              EmbabedUtility.socialLightGray,
            ),
            title: Text("Fotoğraf Çek"),
          ),
          ListTile(
            onTap: onTapGallery,
            leading: Icon(
              Icons.photo_album,
              color: EmbabedUtility.socialLightGray,
            ),
            title: Text("Fotoğraf Seç"),
          )
        ]));
  }
}
