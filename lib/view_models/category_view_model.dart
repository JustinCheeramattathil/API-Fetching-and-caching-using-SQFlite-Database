import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../repository/category_repository.dart';

class CategoryViewModel extends ChangeNotifier {
  final CategoryRepository _repository;

  CategoryViewModel(this._repository);

  Category? _categories;
  Category? get categories => _categories;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();

    try {
      _categories = await _repository.fetchCategories();
    } catch (error) {
      // Handle error appropriately.
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}