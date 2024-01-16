import 'package:dio/dio.dart';
import 'package:webandcrafts/core/api_constants.dart';

import '../models/single_banner_model.dart';

class BannerRepository {
  final Dio _dio;
  BannerRepository(this._dio);
  Future<SingleBanner> fetchSingleBanner() async {
    try {
      final response = await _dio.get(apiendpoint);

      if (response.statusCode == 200) {
        return SingleBanner.fromJson(response.data);
      } else {
        throw Exception('Failed to load single banner');
      }
    } catch (error) {
      throw Exception('Failed to load single banner: $error');
    }
  }
}
