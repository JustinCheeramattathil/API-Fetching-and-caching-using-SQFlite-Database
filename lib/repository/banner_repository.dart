import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:webandcrafts/core/api_constants.dart';

import '../models/single_banner_model.dart';

class BannerRepository {
  final Dio _dio;//Instance of Dio
  Database? _database; 
  BannerRepository(this._dio);


//This function is used to fetch and save values from API response to Sqflite database
  Future<SingleBanner> fetchAndSaveSingleBanner() async {
    try {
      final banner = await fetchSingleBanner();
      await saveSingleBannerToDatabase(banner);
      return banner;
    } catch (error) {
      log('Error fetching and saving banner: $error');
      throw Exception('Failed to fetch and save single banner');
    }
  }

  //This is the API Fetching function for taking the single banner from API results
  Future<SingleBanner> fetchSingleBanner() async {
    try {
      final response = await _dio
          .get(apiendpoint); //Passing the request in the form of API URL
      if (response.statusCode == 200) {
        final res = response.data as List;

        final singleBanner = SingleBanner.fromJson(res[2]);
        return singleBanner; //Returning the fetched data
      } else {
        throw Exception('Failed to load single banner');
      }
    } catch (error) {
      throw Exception('Failed to load single banner: $error');
    }
  }

//This is the function used to to initialize the local database
  Future<void> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'banners.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE banners (id INTEGER PRIMARY KEY, title TEXT, image TEXT)',
        );
      },
    );
  }

//Here we are saving the datas to the local database for caching
  Future<void> saveSingleBannerToDatabase(SingleBanner banner) async {
    await _initDatabase();
    final db = _database;
    await db!.insert(
      'banners',
      banner.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    log('Single banner saved to database: $banner');
  }

//This function indicates that we get the values from the local database
  Future<List<SingleBanner>> getStoredBanner() async {
    await _initDatabase();
    final db = _database;
    final maps = await db!.query('banners');
    return List.generate(maps.length, (i) => SingleBanner.fromMap(maps[i]));
  }
}
