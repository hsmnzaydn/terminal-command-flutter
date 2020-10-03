import 'package:flutter/cupertino.dart';
import 'package:terminal_commands_flutter/model/Category.dart';
import 'package:terminal_commands_flutter/model/Command.dart';
import 'package:terminal_commands_flutter/services/commands/CommandApiProvider.dart';

class CommandRepository {
  final CommandApiProvider apiProvider;

  CommandRepository({@required this.apiProvider})
      : assert(apiProvider != null);

   getCommandsOfQuery(String query) {
    return apiProvider.getCommandsOfQuery(query);
  }
}
