import 'package:flutter/material.dart';
import 'package:psikoz/core/components/inputbar/search_bar_widget.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';


class SearchView extends GetView<HomeController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75),
          child: AppBar(
            flexibleSpace: const Padding(
              padding:  EdgeInsets.all(15.0),
              child: SearchBarWidget(),
            ),
          ),
        ),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SizedBox(
                height: Get.height * 0.05,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border:
                                  Border.all(color: Get.isDarkMode ? Colors.white:Colors.black, width: 0.4)),
                          child:   Center(
                              child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Hello",style: Get.textTheme.bodyLarge),
                          ))),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) { 
   }) )
           
          ],
        ),
      ),
    );
  }
}

