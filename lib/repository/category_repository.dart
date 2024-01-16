import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:webandcrafts/core/api_constants.dart';

import '../models/category_model.dart';

class CategoryRepository {
  final Dio _dio;
  CategoryRepository(this._dio);

  Future<List<Category>> fetchCategories() async {
    try {
      final response = await _dio.get(apiendpoint);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.toString());
        final Map<String, dynamic> map = data[4];
        log(map.toString(), name: 'map');
        final List<Category> categories = map['contents']
            .map((categoryData) => Category.fromJson(categoryData))
            .toList();
        return categories;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
