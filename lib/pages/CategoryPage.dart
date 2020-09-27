import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terminal_commands_flutter/components/CardWidget.dart';
import 'package:terminal_commands_flutter/components/DialogWidget.dart';
import 'package:terminal_commands_flutter/components/Style.dart';
import 'package:terminal_commands_flutter/model/Category.dart';
import 'package:terminal_commands_flutter/pages/CategoryDetailPage.dart';
import 'package:terminal_commands_flutter/services/CategoryServices.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoryPageState();
  }
}

class _CategoryPageState extends State<CategoryPage> {
  Future<List<Category>> category;

  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();

  @override
  void initState() {
    category = getCategories();
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
        title: Text("Categories"),
      ),
      body: _ListViewWidget(category),
    );
  }
}

class _ListViewWidget extends StatelessWidget {
  Future<List<Category>> category;

  _ListViewWidget(Future<List<Category>> category) {
    this.category = category;
  }

  @override
  Widget build(BuildContext context) {
    return _categoryListView(category, context);
  }
}

Widget _categoryListView(Future categoryList, BuildContext context) {
  return FutureBuilder(
    future: categoryList,
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
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CategoryDetailPage(data[index]))),
                    child: categoryCardView(data[index]),
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
