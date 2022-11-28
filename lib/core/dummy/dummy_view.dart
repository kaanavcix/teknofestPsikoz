/* import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/init/theme/text_theme.dart';
import 'package:psikoz/core/service/firebase/firebase_db.dart';
import 'package:psikoz/core/utility/app/sizedbox_utility.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/controller/profile_controller.dart';
import 'package:psikoz/controller/set_controller.dart';
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

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var edgeInsets = EdgeInsets.symmetric(vertical: 20);
    return sc(edgeInsets);
  }

  Scaffold sc(EdgeInsets edgeInsets) {
    return Scaffold(
        body: Form(
      autovalidateMode: controller.isFailed.value
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      key: controller.formState,
      child: Column(
        children: [
          PsikozTextBar(
              prefixIcon: Padding(
                  padding: edgeInsets,
                  child: IconNames.profile
                      .tosvgPictureConvert(EmbabedUtility.socialLightGray)),
              hintText: "İsim",
              validator: (String? value) => value!.isEmpty || value.length < 3
                  ? "Lütfen değer giriniz"
                  : null,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              textcontroller: controller.nameController),
          PsikozTextBar(
            hintText: "Kullanıcı Adı",
            validator: (String? value) => value!.isEmpty || value.length < 3
                ? "Lütfen değer giriniz"
                : null,
            textcontroller: controller.usernameController,
            textInputAction: TextInputAction.next,
          ),
          PsikozTextBar(
            hintText: "E-mail",
            validator: (String? value) =>
                !GetUtils.isEmail(value ?? "") ? "Email doğru değil" : null,
            textcontroller: controller.emailController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Padding(
                padding: edgeInsets,
                child: IconNames.email
                    .tosvgPictureConvert(EmbabedUtility.socialLightGray)),
          ),
          PsikozTextBar(
            hintText: "Şifre",
            textcontroller: controller.passwordController,
            validator: (String? value) => value!.isEmpty || value.length < 3
                ? "Lütfen değer giriniz"
                : null,
            prefixIcon: Padding(
                padding: edgeInsets,
                child: IconNames.lock
                    .tosvgPictureConvert(EmbabedUtility.socialLightGray)),
          ),
          PsikozButton(
            child: const Text("Kayıt Ol"),
            onTap: () {
              print("deneme");
              controller.registerControl(UserForRegister(
                  firstName: controller.nameController.text,
                  email: controller.emailController.text,
                  password: controller.passwordController.text,
                  userId: "",
                  userName: controller.usernameController.text));
            },
          ),
        ],
      ),
    ));
  }
}

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller2 = Get.put(FireBaseServiceAuth());
    Get.put(RegisterController());

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Üye Ol", style: grBodyB.copyWith(color: Colors.white)),
          centerTitle: true,
          elevation: 0,
        ),
        body: Obx(() => steppertry(
              context,
            )));
  }

  Stepper steppertry(
    BuildContext context,
  ) {
    return Stepper(
        physics: NeverScrollableScrollPhysics(),
        margin: EdgeInsets.all(20),
        currentStep: controller.currentIndex.value,
        elevation: 0,
        onStepContinue: () =>
            controller.currentIndex.value == steps(controller).length - 1
                ? controller.registerControl(UserForRegister(
                    firstName: controller.nameController.text,
                    email: controller.emailController.text,
                    password: controller.passwordController.text,
                    userName: controller.usernameController.text))
                : controller.currentIndex.value++,
        onStepCancel: () => controller.currentIndex.value == 0
            ? null
            : controller.currentIndex.value--,
        onStepTapped: (index) {
          controller.currentIndex.value = index;
        },
        type: StepperType.horizontal,
        steps: steps(controller),
        controlsBuilder: (context, ControlsDetails details) => Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: details.onStepContinue,
                  child: Text(controller.currentIndex.value == 2
                      ? "Kayıt Ol"
                      : "Devam et"),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: EmbabedUtility.socialblue,
                      fixedSize: Size.fromHeight(45) // size ayarlama
                      ),
                )),
                controller.currentIndex.value == 0
                    ? const SizedBox(
                        width: 0,
                        height: 0,
                      )
                    : const SizedBox(
                        width: 16,
                      ),
                controller.currentIndex.value == 0
                    ? const SizedBox(
                        width: 0,
                        height: 0,
                      )
                    : Expanded(
                        child: TextButton(
                        onPressed: details.onStepCancel,
                        child: Text("Geri Dön"),
                        style: TextButton.styleFrom(
                            foregroundColor: EmbabedUtility.socialPurple,
                            fixedSize: const Size.fromHeight(45)),
                      ))
              ],
            ));
  }
}

List<Step> steps(RegisterController controller) => [
      Step(
        isActive: controller.currentIndex.value >= 0,
        state: controller.currentIndex.value > 0
            ? StepState.complete
            : StepState.indexed,
        title: Text(
          "Kullanıcı adı",
          style: Get.textTheme.headline1,
        ),
        content: Column(
          children: [
            Text(
              "İlk olarak bir kullanıcı adı belirleyiniz",
              style: Get.textTheme.bodyMedium,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 8.0, left: 8, top: 3, bottom: 20),
              child: PsikozTextBar(
                  hintText: "Kullanıcı Adı",
                  prefixIcon: Icon(Icons.person, size: 20),
                  textcontroller: controller.usernameController),
            ),
          ],
        ),
      ),
      Step(
        isActive: controller.currentIndex.value >= 1,
        title: Text(
          "E-mail",
          style: Get.textTheme.headline1,
        ),
        content: Column(children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 8.0, left: 8, top: 2, bottom: 20),
            child: PsikozTextBar(
                hintText: "Email",
                prefixIcon: Icon(Icons.person, size: 20),
                textcontroller: controller.emailController),
          ),
        ]),
      ),
      Step(
        isActive: controller.currentIndex.value >= 2,
        title: Text(
          "Şifre",
          style: Get.textTheme.headline1,
        ),
        content: Column(children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 8.0, left: 8, top: 2, bottom: 2),
            child: PsikozTextBar(
                hintText: "Şifre",
                prefixIcon: Icon(Icons.person, size: 20),
                textcontroller: controller.passwordController),
          ),
        ]),
      )
    ];

*/
