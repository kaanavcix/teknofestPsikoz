import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:painter/painter.dart';
import 'package:psikoz/controller/onboarding/draw_controller.dart';

class PostDrawView extends GetView<DrawController> {
  const PostDrawView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DrawController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Draw View"),
        actions: actions(),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: DrawBar(controller.controller)),
      ),
      body: Center(child: Painter(controller.controller)),
    );
  }

  List<Widget> actions() {
    return [
      GetBuilder<DrawController>(
        builder: (_) {
          return IconButton(
            icon: Icon(
              Icons.undo,
              color: controller.controller.isEmpty ? Colors.grey : Colors.white,
            ),
            onPressed: controller.controller.isEmpty
                ? null
                : () => controller.controller.undo(),
          );
        },
      ),
      IconButton(
        icon: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
        onPressed: controller.controller.clear,
        color: Colors.white,
      ),
      const IconButton(
          icon: Icon(
            Icons.check,
            color: Colors.white,
          ),
          onPressed: null),
    ];
  }
}

class DrawBar extends GetView<DrawController> {
  final PainterController _controller;

  DrawBar(this._controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child:  
          Slider(
            value: _controller.thickness,
            onChanged: controller.changeOn,
            min: 1.0,
            max: 20.0,
            activeColor: Colors.black,
          ),),
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return RotatedBox(
              quarterTurns: _controller.eraseMode ? 2 : 0,
              child: IconButton(
                  icon: Icon(Icons.create),
                  tooltip: (_controller.eraseMode ? 'Disable' : 'Enable') +
                      ' eraser',
                  onPressed: () {
                    setState(() {
                      _controller.eraseMode = !_controller.eraseMode;
                    });
                  }));
        }),
        ColorPickerButton(_controller, false),
        ColorPickerButton(_controller, true),
      ],
    );
  }
}

class ColorPickerButton extends StatefulWidget {
  final PainterController _controller;
  final bool _background;

  ColorPickerButton(this._controller, this._background);

  @override
  _ColorPickerButtonState createState() => new _ColorPickerButtonState();
}

class _ColorPickerButtonState extends State<ColorPickerButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(_iconData, color: _color),
        tooltip: widget._background
            ? 'Change background color'
            : 'Change draw color',
        onPressed: _pickColor);
  }

  void _pickColor() {
    Color pickerColor = _color;
    Navigator.of(context)
        .push(MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) {
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('Pick color'),
                  ),
                  body: Container(
                      alignment: Alignment.center,
                      child: ColorPicker(
                        pickerColor: pickerColor,
                        onColorChanged: (Color c) => pickerColor = c,
                      )));
            }))
        .then((_) {
      setState(() {
        _color = pickerColor;
      });
    });
  }

  Color get _color => widget._background
      ? widget._controller.backgroundColor
      : widget._controller.drawColor;

  IconData get _iconData =>
      widget._background ? Icons.format_color_fill : Icons.brush;

  set _color(Color color) {
    if (widget._background) {
      widget._controller.backgroundColor = color;
    } else {
      widget._controller.drawColor = color;
    }
  }
}
