import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';

import '../../core/init/theme/text_theme.dart';
class ArticleView extends StatelessWidget {
  const ArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const edgeInsets =  EdgeInsets.all(8);
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,title: Text("Makaleler ",style: Get.textTheme.displaySmall),actions: [

      Padding(padding: edgeInsets,child:IconNames.alert.tosvgPictureConvert(null))
      ],),

      body: Column(
        children: [

         Placeholder(color: Colors.blue,
         fallbackHeight: 100,
         fallbackWidth: Get.width,
        
         ),
          Placeholder(color: Colors.blue,
         fallbackHeight: 100,
         ),
          Placeholder(color: Colors.blue,
         fallbackHeight: 100,
         ),
          Placeholder(color: Colors.blue,
         fallbackHeight: 100,
         ),
          Placeholder(color: Colors.blue,
         fallbackHeight: 100,
         ), Placeholder(color: Colors.blue,
         fallbackHeight: 100,
         )
        ],
      ),
    );
  }
}