import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terminal_commands_flutter/components/CardWidget.dart';
import 'package:terminal_commands_flutter/components/DialogWidget.dart';
import 'package:terminal_commands_flutter/model/Command.dart';
import 'package:terminal_commands_flutter/components/Style.dart';
import 'package:terminal_commands_flutter/services/CommandServices.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  String query = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDarkColor,
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          createTextField(
              "Search",
              (query) => {
                    if (query.length >= 3)
                      {
                        setState(() {
                          this.query = query;
                        })
                      }
                  }),
          Expanded(child: _ListViewWidget(query))
        ],
      ),
    );
  }
}

class _ListViewWidget extends StatelessWidget {
  Future<List<Command>> commandList;
  String query;

  _ListViewWidget(String query) {
    this.commandList = getCommandsOfQuery(query);
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
                shrinkWrap: true,
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
