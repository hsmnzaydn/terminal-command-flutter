import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terminal_commands_flutter/components/card_widget.dart';
import 'package:terminal_commands_flutter/components/dialog_widget.dart';
import 'package:terminal_commands_flutter/components/Style.dart';
import 'package:terminal_commands_flutter/components/loading_widget.dart';
import 'package:terminal_commands_flutter/pages/search/search_controller.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDarkColor,
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Container(
        child: GetX<SearchController>(
            initState: (state) {},
            builder: (_) {
              return Column(
                children: [
                  createTextField(
                      "Search",
                      (query) => {
                            if (query.length >= 2)
                              {
                                Get.find<SearchController>()
                                    .getCommandsOfQuery(query)
                              }
                            else
                              {Get.find<SearchController>().deleteList()}
                          }),
                  Expanded(child: _ListViewWidget(_))
                ],
              );
            }),
      ),
    );
  }

  Widget _ListViewWidget(SearchController _) {
    return _.commandList.length < 1
        ? LoadingWidget()
        : ListView.builder(
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
