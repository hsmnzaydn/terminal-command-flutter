import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terminal_commands_flutter/components/CardWidget.dart';
import 'package:terminal_commands_flutter/components/DialogWidget.dart';
import 'package:terminal_commands_flutter/components/Style.dart';
import 'package:terminal_commands_flutter/model/Category.dart';
import 'package:terminal_commands_flutter/model/Command.dart';
import 'package:terminal_commands_flutter/services/CategoryServices.dart';

class CategoryDetailPage extends StatefulWidget {
  final Category category;

  CategoryDetailPage(this.category);

  @override
  State<StatefulWidget> createState() {
    return _CategoryDetailPageState(category);
  }
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  final Category category;
  Future<List<Command>> commandList;
  _CategoryDetailPageState(this.category);

  @override
  void initState() {
    commandList = getCommandOfCategory(category.sId);
    super.initState();
  }

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
      body: _ListViewWidget(commandList),
    );
  }
}

class _ListViewWidget extends StatelessWidget {
  Future<List<Command>> commandList;

  _ListViewWidget(Future<List<Command>> commandList) {
    this.commandList = commandList;
  }

  @override
  Widget build(BuildContext context) {
    return _commandListView(commandList, context);
  }
}

Widget _commandListView(Future commandList, BuildContext context) {
  return FutureBuilder(
    future: commandList,
    builder: (context, snapshot) {
      if (snapshot.connectionState != ConnectionState.done) {
        return LinearProgressIndicator();
      } else {
        if (snapshot.hasError) {
          return Text("[snapshot.error.toString()]");
        } else {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, int index) {
                  return new GestureDetector(
                    //You need to make my child interactive
                    onTap: () => {
                      confirmDialog(
                          context, data[index].title, data[index].description)
                    },
                    child: commandCardView(data[index]),
                  );
                });
          } else {
            return Text("No DAta");
          }
        }
      }
    },
  );
}
