import 'package:terminal_commands_flutter/model/Category.dart';
import 'package:terminal_commands_flutter/model/Command.dart';
import 'package:terminal_commands_flutter/services/commands/CommandRepository.dart';

Future<List<Command>> getCommandsOfQuery(String query) async {
  return await CommandRepository().getCommandsOfQuery(query);
}
