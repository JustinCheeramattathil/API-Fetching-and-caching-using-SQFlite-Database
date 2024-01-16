import 'package:dio/dio.dart';
import 'package:webandcrafts/core/api_constants.dart';

import '../models/slider_banner_model.dart';

class SliderRepository {
  final Dio _dio;
  SliderRepository(this._dio);
  Future<SliderBanner> fetchSliderBanner() async {
    try {
      final response = await _dio.get(apiendpoint);

      if (response.statusCode == 200) {
        return SliderBanner.fromJson(response.data);
      } else {
        throw Exception('Failed to load slider banner');
      }
    } catch (error) {
      throw Exception('Failed to load slider banner: $error');
    }
  }
}
