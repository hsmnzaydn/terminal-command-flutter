import 'package:get/get.dart';
import 'package:terminal_commands_flutter/pages/categories/CategoryController.dart';
import 'package:terminal_commands_flutter/pages/category_detail/CategoryDetailController.dart';
import 'package:terminal_commands_flutter/services/category/CategoryApiProvider.dart';
import 'package:terminal_commands_flutter/services/category/CategoryRepository.dart';

class CategoriesBinding implements Bindings {

  @override
  void dependencies() {

    Get.lazyPut<CategoryDetailController>(() {
      return CategoryDetailController(
          repository: CategoryRepository(apiProvider: CategoryApiProvider()));
    });

    Get.lazyPut<CategoryController>(() {
      return CategoryController(
          repository: CategoryRepository(apiProvider: CategoryApiProvider()));
    });
  }


}
