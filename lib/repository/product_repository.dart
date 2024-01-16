import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:webandcrafts/core/api_constants.dart';

import '../models/product_model.dart';

class ProductRepository {
  final Dio _dio;
  ProductRepository(this._dio);

  Future<List<Product>> fetchProducts() async {
    log('hoooi');
    try {
      final response = await _dio.get(apiendpoint);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.toString());
        log(data.toString(), name: 'data');
        final Map<String, dynamic> map = data[1];
        log(map.toString(), name: 'map');
        final List<Product> products = map['contents']
            .map((categoryData) => Product.fromJson(categoryData))
            .toList();
        return products;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
