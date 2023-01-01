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
    return Card(
      elevation: 8,
      clipBehavior: Clip.none,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextFormField(
              cursorColor: Colors.white,
              decoration:  InputDecoration(
        hintText: "Ne aratmak isterseniz ...",
        hintStyle: Get.textTheme.bodySmall,
                  //  suffixIcon: Icon(Icons.search),
                  constraints: BoxConstraints(
                    maxHeight: 25,
                  ),
                  filled: false,
                  fillColor: Colors.transparent,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none)),
        ),
      ),
    );
  }
}
