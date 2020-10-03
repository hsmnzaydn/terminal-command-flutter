import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terminal_commands_flutter/components/CardWidget.dart';
import 'package:terminal_commands_flutter/components/DialogWidget.dart';
import 'package:terminal_commands_flutter/components/Style.dart';
import 'package:terminal_commands_flutter/pages/search/SearchController.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDarkColor,
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Container(
        child: GetX<SearchController>(initState: (state) {
          Get.find<SearchController>().getCommandsOfQuery("");
        }, builder: (_) {
          return Column(
            children: [
              createTextField(
                  "Search",
                  (query) => {
                        if (query.length >= 3)
                        Get.find<SearchController>().getCommandsOfQuery(query)

                      }),
              Expanded(
                  child: _ListViewWidget(_))
            ],
          );
        }),
      ),
    );
  }

  Widget _ListViewWidget(SearchController _) {
   return ListView.builder(
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
  }
}
