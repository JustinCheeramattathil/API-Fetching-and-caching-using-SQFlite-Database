import 'package:dio/dio.dart';

import '../models/product_model.dart';

class ProductRepository {
  final Dio _dio;
  ProductRepository(this._dio);

  Future<Product> fetchProducts() async {
    try {
      final response = await _dio.get('YOUR_PRODUCTS_API_ENDPOINT_HERE');

      if (response.statusCode == 200) {
        return Product.fromJson(response.data);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Failed to load products: $error');
    }
  }
}
