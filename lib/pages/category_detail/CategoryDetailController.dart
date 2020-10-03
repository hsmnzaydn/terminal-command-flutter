
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:terminal_commands_flutter/model/Category.dart';
import 'package:terminal_commands_flutter/model/Command.dart';
import 'package:terminal_commands_flutter/services/category/CategoryRepository.dart';

class CategoryDetailController extends GetxController {

  final CategoryRepository repository;

  CategoryDetailController({@required this.repository}) : assert(repository != null);

  var _category = Category().obs;
  get category => this._category.value;
  set category(value) => this._category.value = value;

  var _commandList = List<Command>().obs;
  get commandList => this._commandList.value;
  set commandList(value) => this._commandList.value = value;


  getCommandsOfCategories(String categoryId){
    repository.getCommandOfCategory(categoryId).then((data) {
      this.commandList = data;
    });
  }

}