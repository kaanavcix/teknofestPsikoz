import 'package:flutter/cupertino.dart';

class PaddinUtilty extends Padding {
  PaddinUtilty.normalPadding({double padding = 8, super.key})
      : super(padding: EdgeInsets.all(padding));
  const PaddinUtilty.largerPadding({super.key})
      : super(padding: const EdgeInsets.all(10));
  PaddinUtilty.leftPadding({double padding = 8.0, super.key})
      : super(padding: EdgeInsets.only(left: padding));
  PaddinUtilty.rightPadding({double padding = 8.0, super.key})
      : super(padding: EdgeInsets.only(right: padding));

  PaddinUtilty.horizontalPadding({double height = 8, super.key})
      : super(padding: EdgeInsets.symmetric(horizontal: height));
  PaddinUtilty.verticalPadding({double height = 8, super.key})
      : super(padding: EdgeInsets.symmetric(vertical: height));
  PaddinUtilty.bottomPadding({double height = 15, super.key})
      : super(padding: EdgeInsets.only(bottom: height));

  PaddinUtilty.topPadding(double height)
      : super(padding: EdgeInsets.only(top: height));
}
