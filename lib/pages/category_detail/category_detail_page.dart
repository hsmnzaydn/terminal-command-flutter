import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terminal_commands_flutter/bindings/search_binding.dart';
import 'package:terminal_commands_flutter/components/card_widget.dart';
import 'package:terminal_commands_flutter/components/dialog_widget.dart';
import 'package:terminal_commands_flutter/components/Style.dart';
import 'package:terminal_commands_flutter/components/loading_widget.dart';
import 'package:terminal_commands_flutter/model/category.dart';
import 'package:terminal_commands_flutter/pages/category_detail/category_detail_controller.dart';
import 'package:terminal_commands_flutter/pages/search/search_page.dart';

class CategoryDetailPage extends GetView<CategoryDetailController> {
  final Category category;

  CategoryDetailPage(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDarkColor,
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                Get.to(SearchPage(), binding: SearchBinding());
              })
        ],
        title: Text(category.title),
      ),
      body: Container(
        child: GetX<CategoryDetailController>(initState: (state) {
          Get.find<CategoryDetailController>()
              .getCommandsOfCategories(category.sId);
        }, builder: (_) {
          return _.commandList.length < 1
              ? LoadingWidget()
              :
           ListView.builder(
            itemBuilder: (context, index) {
              return new GestureDetector(
                //You need to make my child interactive
                onTap: () => {
                  confirmDialog(context, _.commandList[index].title,
                      _.commandList[index].description)
                },
                child: commandCardView(_.commandList[index]),
              );
            },
            itemCount: _.commandList.length,
          );
        }),
      ),
    );
  }
}
