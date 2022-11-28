import 'package:flutter/cupertino.dart';

class ScrollPyhcisyUtilty extends ScrollPhysics {
  const ScrollPyhcisyUtilty.neverScroll()
      : super(parent: const NeverScrollableScrollPhysics());

  const ScrollPyhcisyUtilty.bouncAlways()
      : super(
            parent: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()));
}
