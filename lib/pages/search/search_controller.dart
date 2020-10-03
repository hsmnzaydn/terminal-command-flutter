import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:terminal_commands_flutter/model/command.dart';
import 'package:terminal_commands_flutter/services/commands/command_repository.dart';

class SearchController extends GetxController{
  final CommandRepository repository;


  SearchController({@required this.repository}) : assert(repository != null);

  var _commandList = List<Command>().obs;
  get commandList => this._commandList.value;
  set commandList(value) => this._commandList.value = value;


  getCommandsOfQuery(String query){
    repository.getCommandsOfQuery(query).then((data) {
      this.commandList = data;
    });
  }

  deleteList() {
    this.commandList = [];
  }
}