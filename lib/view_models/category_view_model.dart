import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../repository/category_repository.dart';

class CategoryViewModel extends ChangeNotifier {
  final CategoryRepository _repository;

  CategoryViewModel(this._repository);

  List<Category>? _categories;
  List<Category>? get categories => _categories;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchCategories() async {
    _isLoading = true;

    try {
      _categories = await _repository.fetchCategories();
    } catch (error) {
      // Handle error appropriately.
      print('Error: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
