

import 'package:terminal_commands_flutter/model/Category.dart';
import 'package:terminal_commands_flutter/model/Command.dart';
import 'package:terminal_commands_flutter/services/category/CategoryApiProvider.dart';

class CategoryRepository{
  CategoryApiProvider _apiProvider = CategoryApiProvider();

  Future<List<Category>> getCategories(){
    return _apiProvider.getCategories();
  }

  Future<List<Command>> getCommandOfCategory(String categoryId){
    return _apiProvider.getCommandsOfCategory(categoryId);
  }
}