import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:webandcrafts/core/api_constants.dart';

import '../models/product_model.dart';

class ProductRepository {
  
  final Dio _dio;
  Database? _database;
  ProductRepository(this._dio);

   // Function to fetch and save products from API to database
  Future<List<Product>> fetchAndSaveProducts() async {
    try {
      final products = await fetchProducts();
      await saveProductsToDatabase(products);
      return products;
    } catch (error) {
      log('Error fetching and saving products: $error');
      throw Exception('Failed to fetch and save products');
    }
  }

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _dio.get(apiendpoint);
      if (response.statusCode == 200) {
        List<Product> products = [];

        for (var productJson in response.data[1]['contents']) {
          products.add(Product.fromJson(productJson));
        }

        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
   // Function to initialize the database (if not already initialized)
  Future<void> _initDatabase() async {
    if (_database == null) {
      final databasePath = await getDatabasesPath();
      final path = join(databasePath, 'products.db');
      _database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            'CREATE TABLE products (id INTEGER PRIMARY KEY, productName TEXT, productImage TEXT, productRating INTEGER, actualPrice TEXT, offerPrice TEXT, discount TEXT)',
          );
        },
      );
    }
  }

  // Function to save products to the database
  Future<void> saveProductsToDatabase(List<Product> products) async {
    await _initDatabase();
    final db = _database;
    for (Product product in products) {
      await db!.insert(
        'products',
        product.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    log('Products saved to database: $products');
  }

  // Function to get stored products from the database
  Future<List<Product>> getStoredProducts() async {
    await _initDatabase();
    final db = _database;
    final maps = await db!.query('products');
    return List.generate(maps.length, (i) => Product.fromMap(maps[i]));
  }
}
