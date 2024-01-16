import 'package:dio/dio.dart';
import 'package:webandcrafts/core/api_constants.dart';

import '../models/category_model.dart';

class CategoryRepository {
  final Dio _dio;
  CategoryRepository(this._dio);

  Future<Category> fetchCategories() async {
    try {
      final response = await _dio.get(apiendpoint);

      if (response.statusCode == 200) {
        return Category.fromJson(response.data);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      throw Exception('Failed to load categories: $error');
    }
  }
}
