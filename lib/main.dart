import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terminal_commands_flutter/components/Style.dart';
import 'package:terminal_commands_flutter/pages/categories/category_page.dart';

import 'bindings/categories_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: CategoriesBinding(),
        home: CategoryPage(),
        theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: accnetColor,
        primaryColorDark: primaryDarkColor
    ),);
  }

}
