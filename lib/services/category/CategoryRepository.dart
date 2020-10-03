import 'package:flutter/cupertino.dart';
import 'package:terminal_commands_flutter/model/Category.dart';
import 'package:terminal_commands_flutter/model/Command.dart';
import 'package:terminal_commands_flutter/services/category/CategoryApiProvider.dart';

class CategoryRepository {
  final CategoryApiProvider apiProvider;

  CategoryRepository({@required this.apiProvider})
      : assert(apiProvider != null);

  getCategories() {
    return apiProvider.getCategories();
  }

  getCommandOfCategory(String categoryId) {
    return apiProvider.getCommandsOfCategory(categoryId);
  }
}
