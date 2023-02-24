import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';

class HorizontalOrLine extends StatelessWidget {
  const HorizontalOrLine({
   required this.label,
   required this.height,
  });

  final String label;
  final double height;

  @override
  Widget build(BuildContext context) {

    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: EmbabedUtility.socialLightGray,
              height: height,
            )),
      ),

      Text(label,),

      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Divider(
              color: EmbabedUtility.socialLightGray,
              height: height,
            )),
      ),
    ]);
  }
}