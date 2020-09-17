import 'package:dio/dio.dart';
import 'package:terminal_commands_flutter/model/Category.dart';
import 'package:terminal_commands_flutter/model/Command.dart';
import '../DioClient.dart';

class CategoryApiProvider {
  Dio _dio = DioClient.getDioClient();

  Future<List<Category>> getCategories() async {
    Response response = await _dio.get("categories");
    return (response.data as List).map((x) => Category.fromJson(x)).toList();
  }

  Future<List<Command>> getCommandsOfCategory(String categoryId) async {
    Response response =
        await _dio.get("categories/" + categoryId + "/commands");
    return (response.data as List).map((x) => Command.fromJson(x)).toList();
  }
}
