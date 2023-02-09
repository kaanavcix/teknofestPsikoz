import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/enums/Icon-enums.dart';
import '../../utility/embabed/embabed_utility.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      autocorrect: true,
      itemColor: CupertinoColors.white,
      itemSize: 16,
      style: Get.textTheme.headlineSmall,
      // decoration: BoxDecoration(color: Colors.white),
    );
  }
}
