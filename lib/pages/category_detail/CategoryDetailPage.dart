import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terminal_commands_flutter/components/CardWidget.dart';
import 'package:terminal_commands_flutter/components/DialogWidget.dart';
import 'package:terminal_commands_flutter/components/Style.dart';
import 'package:terminal_commands_flutter/model/Category.dart';
import 'package:terminal_commands_flutter/pages/category_detail/CategoryDetailController.dart';

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
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: Colors.white),
          )
        ],
        title: Text(category.title),
      ),
      body: Container(
        child: GetX<CategoryDetailController>(
            initState: (state) {
              Get.find<CategoryDetailController>().getCommandsOfCategories(
                  category.sId);
            },
            builder: (_) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return new GestureDetector(
                    //You need to make my child interactive
                    onTap: () =>
                    {
                      confirmDialog(
                          context, _.commandList[index].title,
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






