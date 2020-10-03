import 'package:get/get.dart';
import 'package:terminal_commands_flutter/pages/categories/category_controller.dart';
import 'package:terminal_commands_flutter/pages/category_detail/category_detail_controller.dart';
import 'package:terminal_commands_flutter/services/category/category_api_provider.dart';
import 'package:terminal_commands_flutter/services/category/category_repository.dart';

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
