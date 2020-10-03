import 'package:dio/dio.dart';
import 'package:terminal_commands_flutter/model/Command.dart';
import '../DioClient.dart';

class CommandApiProvider {
  Dio _dio = DioClient.getDioClient();

   getCommandsOfQuery(String query) async {
    var response = await _dio.get("commands?commandTitle=" + query);
    return (response.data as List).map((x) => Command.fromJson(x)).toList();
  }
}
