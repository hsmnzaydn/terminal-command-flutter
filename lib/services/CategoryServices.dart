import 'package:terminal_commands_flutter/model/Category.dart';
import 'package:terminal_commands_flutter/model/Command.dart';
import 'package:terminal_commands_flutter/services/category/CategoryRepository.dart';

Future<List<Category>> getCategories() async {
  List<Category> categories = await CategoryRepository().getCategories();
  return categories;
}

Future<List<Command>> getCommandOfCategory(String categoryId) async{
  return await CategoryRepository().getCommandOfCategory(categoryId);
}
