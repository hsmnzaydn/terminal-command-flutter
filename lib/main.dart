import 'package:flutter/material.dart';
import 'package:terminal_commands_flutter/components/Style.dart';
import 'package:terminal_commands_flutter/pages/CategoryPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: CategoryPage(),
        theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: accnetColor,
        primaryColorDark: primaryDarkColor
    ),);
  }

}
