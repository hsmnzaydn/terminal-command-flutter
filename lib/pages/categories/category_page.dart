import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terminal_commands_flutter/bindings/categories_binding.dart';
import 'package:terminal_commands_flutter/bindings/search_binding.dart';
import 'package:terminal_commands_flutter/components/card_widget.dart';
import 'package:terminal_commands_flutter/components/Style.dart';
import 'package:terminal_commands_flutter/components/loading_widget.dart';
import 'package:terminal_commands_flutter/pages/search/search_page.dart';
import 'package:terminal_commands_flutter/pages/categories/category_controller.dart';
import 'package:terminal_commands_flutter/pages/category_detail/category_detail_page.dart';

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
              return _.categoryList.length < 1
                  ?LoadingWidget()
                  :
               ListView.builder(
                  itemBuilder: (context, index) {
                    return new GestureDetector(
                      onTap: () => {
                            Get.to(CategoryDetailPage(_.categoryList[index]),binding: CategoriesBinding())
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



