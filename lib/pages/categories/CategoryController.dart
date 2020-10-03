import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:terminal_commands_flutter/model/Category.dart';
import 'package:terminal_commands_flutter/services/category/CategoryRepository.dart';

class CategoryController extends GetxController {

  final CategoryRepository repository;

  CategoryController({@required this.repository}) : assert(repository != null);

  var _categoryList = List<Category>().obs;

  get categoryList {
    return this._categoryList.value;
  }

  set categoryList(value) {
    this._categoryList.value = value;
  }

  void getCategoryList() {
    repository.getCategories().then((data) {
      this.categoryList = data;
    });
  }
}
