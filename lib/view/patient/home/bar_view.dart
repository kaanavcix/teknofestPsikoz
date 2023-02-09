import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/product/widgets/discovery_card.dart';

import '../../../product/service/model/material/book_model.dart';

class BarView extends StatelessWidget {
  BarView(this.title,this.bookmodel,{super.key});


  String title;
  BookModel? bookmodel;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(title,style: Get.textTheme.bodyMedium,),

      ) ,
      body: ListView.builder(
        itemCount:bookmodel?.data?.length ,
        itemBuilder: (BuildContext context, int index) {
          var data = bookmodel?.data?[index];
          return DiscoverCard(
            text1: data?.id.toString(),
            text2: data?.title,
          )
           ;
        },
      ),
    );
  }
}