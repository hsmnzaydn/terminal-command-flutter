import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terminal_commands_flutter/bindings/search_binding.dart';
import 'package:terminal_commands_flutter/components/CardWidget.dart';
import 'package:terminal_commands_flutter/components/Style.dart';
import 'package:terminal_commands_flutter/pages/search/SearchPage.dart';
import 'package:terminal_commands_flutter/pages/categories/CategoryController.dart';
import 'package:terminal_commands_flutter/pages/category_detail/CategoryDetailPage.dart';

class CategoryPage extends GetView<CategoryController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDarkColor,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Get.to(SearchPage(),binding: SearchBinding());
            },
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: Colors.white),
          )
        ],
        title: Text("Categories"),
      ),
      body: Container(
        child: GetX<CategoryController>(
            initState: (state) {
              Get.find<CategoryController>().getCategoryList();
            },
            builder: (_) {
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return new GestureDetector(
                      //You need to make my child interactive
                      onTap: () => {
                            Get.to(CategoryDetailPage(_.categoryList[index]))
                      },
                      child: categoryCardView(_.categoryList[index]),
                    );
                  },
                  itemCount: _.categoryList.length,
                );
            }),
      ),
    );
  }

}



