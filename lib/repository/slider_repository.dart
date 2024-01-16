import 'package:dio/dio.dart';
import 'package:webandcrafts/core/api_constants.dart';

import '../models/slider_banner_model/slider_banner_model.dart';

class SliderRepository {
  final Dio _dio;
  SliderRepository(this._dio);
  Future<List<SliderBanner>> fetchSliderBanner() async {
    try {
      final response = await _dio.get(apiendpoint);
      if (response.statusCode == 200) {
        final res = response.data as List;
        final data = res.first['contents'] as List;
        final List<SliderBanner> list = data.map((e) {
          return SliderBanner.fromJson(e);
        }).toList();
        return list;
      } else {
        throw Exception('Failed to load single banner');
      }
    } catch (error) {
      throw Exception('Failed to load single banner: $error');
    }
  }
}
