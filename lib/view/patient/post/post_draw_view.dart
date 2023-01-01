import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:painter/painter.dart';

import 'package:psikoz/controller/onboarding/draw_controller.dart';
import 'package:psikoz/core/components/buttons/psikoz_button.dart';
import 'package:psikoz/core/components/iconWidget/leading_widget.dart';
import 'package:psikoz/core/utility/app/padding_utility.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/view/patient/post/post_view_2_page.dart';

class PostDrawView extends GetView<DrawController> {
  const PostDrawView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DrawController());
    const data = "Çizim";
    return Scaffold(
      bottomNavigationBar:
          const SizedBox(height: kToolbarHeight, child: DrawingBar()),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(data),
        actions: actions(context),
      ),
      body: Center(
          child: Painter(
        controller.controller,
      )),
    );
  }

  List<Widget> actions(BuildContext context) {
    return [
      Obx(() => IconButton(
          icon: Icon(
            Icons.undo,
            color: controller.isLoading.value ? Colors.grey : Colors.white,
          ),
          onPressed: () {
            if (controller.controller.isEmpty) {
              Get.snackbar("Hata", "Geriye alınamıyor");
              controller.loadingBar();
              null;
            } else {
              controller.controller.undo();
            }
          })),
      IconButton(
        icon: const Icon(
          Icons.delete,
        ),
        onPressed: controller.controller.clear,
      ),
      IconButton(
          icon: Icon(
            Icons.check,
          ),
          onPressed: () async {
            await controller.setPhoto(controller.controller.finish().toPNG());
            Get.to(ShowPicture(picture: controller.controller.finish()));
          }),
    ];
  }

  //TODO: burada getxi kurgulayamıyorum error alıyorum context üzreinden devam edelim

  void _show(PictureDetails picture, BuildContext context) {
    controller.finished.toggle();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('View your image'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
            alignment: Alignment.center,
            child: FutureBuilder<Uint8List>(
              future: picture.toPNG(),
              builder:
                  (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    return Image.memory(snapshot.data!);

                  default:
                    return const FractionallySizedBox(
                      widthFactor: 0.1,
                      alignment: Alignment.center,
                      child: AspectRatio(
                          aspectRatio: 1.0, child: CircularProgressIndicator()),
                    );
                }
              },
            )),
      );
    }));
  }
}

class DrawingBar extends GetView<DrawController> {
  const DrawingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: Slider(
              value: controller.thickness.value,
              onChanged: controller.onchange,
              min: 1.0,
              max: 20.0,
              activeColor: Colors.white,
            )),
            RotatedBox(
                quarterTurns: controller.isChange.value ? 2 : 0,
                child: IconButton(
                    icon: const Icon(Icons.create),
                    onPressed: controller.onPress)),
            ColorPickerButton(isBackground: false),
            ColorPickerButton(
              isBackground: true,
            ),
          ],
        ));
  }
}

class ColorPickerButton extends GetView<DrawController> {
  ColorPickerButton({required this.isBackground, super.key});

  bool isBackground;

  IconData get _iconData =>
      isBackground ? Icons.format_color_fill : Icons.brush;
  Color get _color => isBackground
      ? controller.controller.backgroundColor
      : controller.controller.drawColor;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DrawController>(
      builder: (_) {
        return IconButton(
          onPressed: () {
            Get.to(ColorPickerPage(
              isBackgorund: isBackground,
            ));
          },
          icon: Icon(
            _iconData,
            color: _color,
          ),
        );
      },
    );
  }
}

class ColorPickerPage extends GetView<DrawController> {
  ColorPickerPage({required this.isBackgorund, super.key});
  bool isBackgorund;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Color Picker",
          style: Get.textTheme.bodyMedium,
        ),
      ),
      body: SizedBox(
          child: ColorPicker(
        pickerColor: controller.pickerColor.value,
        onColorChanged: (color) {
          controller.onColorChange(color);
          controller.colorDetection(isBackgorund, color);
          ;
        },
      )),
    );
  }
}

class ShowPicture extends GetView<DrawController> {
  //var controller = Get.find<DrawController>();

  PictureDetails picture;
  ShowPicture({
    required this.picture,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            elevation: 0,
            title: const Text("Post Düzenleme Ekranı"),
            actions: [
              ShareButton(
                function: () {},
              )
            ]),
        body: GetBuilder<DrawController>(
          builder: (controller) {
            return SafeArea(
              maintainBottomViewPadding: false,
              child: Column(children: [
                SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        autocorrect: true,

                        //autofillHints: ,
                        enableIMEPersonalizedLearning: true,
                        enableSuggestions: true,
                        // inputFormatters: [TextInputFormatter.],
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.justify,
                        minLines: 10,
                        maxLines: 10,
                        cursorColor: EmbabedUtility.socialwhite,

                        decoration: InputDecoration(
                            hintText: "Lütfen Probleminizi dile getriniz",
                            hintStyle: Get.textTheme.bodyLarge,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            fillColor: Colors.transparent),
                      )),
                      InkWell(
                        onLongPress: () {
                          Get.dialog(Center(
                            child: Hero(
                              tag: controller.photo.value.toString(),
                              child: Image.memory(controller.photo.value),
                            ),
                          ));
                        },
                        child: Padding(
                          padding:
                              PaddinUtilty.normalPadding(padding: 20).padding,
                          child: Hero(
                            tag: controller.photo.value.toString(),
                            child: Image.memory(
                              controller.photo.value,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: PaddinUtilty.topPadding(10).padding,
                  width: Get.width,
                  height: 1,
                  color: Colors.white,
                ),
                Placeholder(
                  fallbackHeight: 150,
                )
              ]),
            );
          },
        ));
  }
}

class HeroDetailPage extends StatelessWidget {
  HeroDetailPage(this.photo, {super.key});

  Uint8List photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Hero(tag: photo.toString(), child: Image.memory(photo))),
    );
  }
}

//!!! Code reflection neeed