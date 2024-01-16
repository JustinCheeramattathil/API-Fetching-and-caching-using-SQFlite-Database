import 'package:flutter/material.dart';
import 'package:webandcrafts/models/single_banner_model/single_banner_model.dart';
import 'package:webandcrafts/repository/banner_repository.dart';

class SingleBannerViewModel extends ChangeNotifier {
  final BannerRepository _repository;

  SingleBannerViewModel(this._repository);

  SingleBanner? _singleBanner;
  SingleBanner? get singleBanner => _singleBanner;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchSingleBanner() async {
    _isLoading = true;

    try {
      _singleBanner = await _repository.fetchSingleBanner();
    } catch (error) {
      //
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
