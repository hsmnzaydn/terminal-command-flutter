import 'package:get/get.dart';
import 'package:terminal_commands_flutter/pages/search/search_controller.dart';
import 'package:terminal_commands_flutter/services/commands/command_api_provider.dart';
import 'package:terminal_commands_flutter/services/commands/command_repository.dart';

class SearchBinding implements Bindings {

  @override
  void dependencies() {

    Get.lazyPut<SearchController>(() {
      return SearchController(
          repository: CommandRepository(apiProvider: CommandApiProvider()));
    });


  }


}