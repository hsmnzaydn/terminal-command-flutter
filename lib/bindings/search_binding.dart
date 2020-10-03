import 'package:get/get.dart';
import 'package:terminal_commands_flutter/pages/search/SearchController.dart';
import 'package:terminal_commands_flutter/services/commands/CommandApiProvider.dart';
import 'package:terminal_commands_flutter/services/commands/CommandRepository.dart';

class SearchBinding implements Bindings {

  @override
  void dependencies() {

    Get.lazyPut<SearchController>(() {
      return SearchController(
          repository: CommandRepository(apiProvider: CommandApiProvider()));
    });


  }


}