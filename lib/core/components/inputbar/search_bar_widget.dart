import 'package:flutter/material.dart';
import '../../constants/enums/Icon-enums.dart';
import '../../utility/embabed/embabed_utility.dart';
class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: EmbabedUtility.socialGray,
      ),
      child: Padding(
        padding: EdgeInsets.zero,
        child: Align(
           alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0),
              child: TextFormField(
                cursorColor: Colors.transparent,
                  decoration: InputDecoration(
                      suffixIcon: Padding(
                          padding:  const EdgeInsets.symmetric(vertical: 14),
                          child: IconNames.search.tosvgPictureConvert(
                              EmbabedUtility.socialLightGray,width: 16,height: 16)),
                      filled: false,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none)),

                      
            )),
      ),
    );
  }
}
