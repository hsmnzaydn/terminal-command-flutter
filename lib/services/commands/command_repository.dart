import 'package:flutter/cupertino.dart';
import 'package:terminal_commands_flutter/model/category.dart';
import 'package:terminal_commands_flutter/model/command.dart';
import 'package:terminal_commands_flutter/services/commands/command_api_provider.dart';

class CommandRepository {
  final CommandApiProvider apiProvider;

  CommandRepository({@required this.apiProvider})
      : assert(apiProvider != null);

   getCommandsOfQuery(String query) {
    return apiProvider.getCommandsOfQuery(query);
  }
}
