import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:webandcrafts/core/api_constants.dart';

import '../models/slider_banner_model.dart';

class SliderRepository {
  final Dio _dio;
  Database? _database;
  SliderRepository(this._dio);



   // Function to fetch and save slider banners from API to database
  Future<List<SliderBanner>> fetchAndSaveSliderBanners() async {
    try {
      final banners = await fetchSliderBanner();
      await saveSliderBannersToDatabase(banners);
      return banners;
    } catch (error) {
      log('Error fetching and saving slider banners: $error');
      throw Exception('Failed to fetch and save slider banners');
    }
  }
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

   // Function to initialize the database (if not already initialized)
  Future<void> _initDatabase() async {
    if (_database == null) {
      final databasePath = await getDatabasesPath();
      final path = join(databasePath, 'slider_banners.db');
      _database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            // Create the table with appropriate columns for SliderBanner
            'CREATE TABLE slider_banners (id INTEGER PRIMARY KEY,imageUrls TEXT,)',
          );
        },
      );
    }
  }

  // Function to save slider banners to the database
  Future<void> saveSliderBannersToDatabase(List<SliderBanner> banners) async {
    await _initDatabase();
    final db = _database;
    for (SliderBanner banner in banners) {
      await db!.insert(
        'slider_banners',
        banner.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    log('Slider banners saved to database: $banners');
  }

  // Function to get stored slider banners from the database
  Future<List<SliderBanner>> getStoredSliderBanners() async {
    await _initDatabase();
    final db = _database;
    final maps = await db!.query('slider_banners');
    return List.generate(maps.length, (i) => SliderBanner.fromMap(maps[i]));
  }
}
