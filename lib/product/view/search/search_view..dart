import 'package:flutter/material.dart';
import 'package:psikoz/core/components/inputbar/search_bar_widget.dart';
import 'package:psikoz/core/components/post/post_bar.dart';

import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class SearchView extends GetView<HomeController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            flexibleSpace: Padding(
              padding:  EdgeInsets.all(15.0),
              child: SearchBarWidget(),
            ),
          ),
        ),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
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
                          child: const Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Hello"),
                          )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border:
                                  Border.all(color: Colors.white, width: 0.4))),
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

