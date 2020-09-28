import 'package:terminal_commands_flutter/model/Category.dart';
import 'package:terminal_commands_flutter/model/Command.dart';
import 'package:terminal_commands_flutter/services/commands/CommandApiProvider.dart';

class CommandRepository {
  CommandApiProvider _apiProvider = CommandApiProvider();

  Future<List<Command>> getCommandsOfQuery(String query) {
    return _apiProvider.getCommandsOfQuery(query);
  }
}
