import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:webandcrafts/core/api_constants.dart';

import '../models/category_model.dart';

class CategoryRepository {
  final Dio _dio;//Instance of dio
  Database? _database;
  CategoryRepository(this._dio);

  // Function to fetch and save categories from API to database
  Future<List<Category>> fetchAndSaveCategories() async {
    try {
      final categories = await fetchCategories();
      await saveCategoriesToDatabase(categories);
      return categories;
    } catch (error) {
      log('Error fetching and saving categories: $error');
      throw Exception('Failed to fetch and save categories');
    }
  }

  Future<List<Category>> fetchCategories() async {
    log('Hellooooo');
    try {
      final response = await _dio.get(apiendpoint);
      if (response.statusCode == 200) {
        List<Category> products = [];

        for (var productJson in response.data[3]['contents']) {
          products.add(Category.fromJson(productJson));
        }

        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  // Function to initialize the database
  Future<void> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'categories.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE categories (id INTEGER PRIMARY KEY, title TEXT,imageUrl TEXT)',
        );
      },
    );
  }

  // Function to save categories to the database
  Future<void> saveCategoriesToDatabase(List<Category> categories) async {
    await _initDatabase();
    final db = _database;
    for (Category category in categories) {
      await db!.insert(
        'categories',
        category.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    log('Categories saved to database: $categories');
  }

  // Function to get stored categories from the database
  Future<List<Category>> getStoredCategories() async {
    await _initDatabase();
    final db = _database;
    final maps = await db!.query('categories');
    return List.generate(maps.length, (i) => Category.fromMap(maps[i]));
  }
}
