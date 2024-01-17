import 'package:flutter/material.dart';
import '../models/slider_banner_model.dart';
import '../repository/slider_repository.dart';

class SliderBannerViewModel extends ChangeNotifier {
  final SliderRepository _repository;

  SliderBannerViewModel(this._repository);

  List<SliderBanner>? _sliderBanner;
  List<SliderBanner>? get sliderBanner => _sliderBanner;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchSliderBanner() async {
    _isLoading = true;

    try {
      _sliderBanner = await _repository.fetchSliderBanner();
    } catch (error) {
      // Handle error appropriately.
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
