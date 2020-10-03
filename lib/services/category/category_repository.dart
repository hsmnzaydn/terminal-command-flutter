import 'package:flutter/cupertino.dart';
import 'package:terminal_commands_flutter/model/category.dart';
import 'package:terminal_commands_flutter/model/command.dart';
import 'package:terminal_commands_flutter/services/category/category_api_provider.dart';

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
