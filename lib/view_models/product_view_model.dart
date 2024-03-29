import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../repository/product_repository.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository _repository;

  ProductViewModel(this._repository);

  List<Product>? _products;
  List<Product>? get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;

    try {
      _products = await _repository.fetchProducts();
    } catch (error) {
      // Handle error appropriately.
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
