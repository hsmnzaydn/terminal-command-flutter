import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terminal_commands_flutter/model/Category.dart';
import 'package:terminal_commands_flutter/model/Command.dart';
import 'package:terminal_commands_flutter/components/Style.dart';

Widget categoryCardView(Category category) {
  return Card(
    child: Container(
        color: primaryColor,
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.all(16.0),
                child: Image(
                  image: NetworkImage(category.iconPath),
                  height: 70.0,
                  width: 100.0,
                )),
            Text(
              category.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16),
            )
          ],
        )),
  );
}

Widget commandCardView(Command command) {
  return Card(
    child: Container(
        padding: EdgeInsets.all(16.0),
        color: primaryColor,
        child: Column(
          children: [
            Text(
              command.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(command.description,
                  style: TextStyle(color: Colors.white, fontSize: 12))
              ],
            ),
          ],
        )),
  );
}
