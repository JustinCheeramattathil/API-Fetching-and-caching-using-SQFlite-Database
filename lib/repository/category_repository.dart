import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:webandcrafts/core/api_constants.dart';

import '../models/category_model/category_model.dart';

class CategoryRepository {
  final Dio _dio;
  CategoryRepository(this._dio);

  Future<List<Category>> fetchCategories() async {
    log('Hellooooo');
    try {
      final response = await _dio.get(apiendpoint);
      log(response.data.toString());
      if (response.statusCode == 200) {
        List<Category> products = [];

        for (var productJson in response.data[3]['contents']) {
          products.add(Category.fromJson(productJson));
        }

        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
