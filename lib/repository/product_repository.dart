import 'package:dio/dio.dart';
import 'package:webandcrafts/core/api_constants.dart';

import '../models/product_model/product_model.dart';

class ProductRepository {
  //
  final Dio _dio;
  ProductRepository(this._dio);

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _dio.get(apiendpoint);
      if (response.statusCode == 200) {
        List<Product> products = [];

        for (var productJson in response.data[1]['contents']) {
          products.add(Product.fromJson(productJson));
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
