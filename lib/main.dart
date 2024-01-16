import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:webandcrafts/models/product_model/product_model.dart';
import 'package:webandcrafts/models/single_banner_model/single_banner_model.dart';
import 'package:webandcrafts/models/slider_banner_model/slider_banner_model.dart';
import 'package:webandcrafts/repository/banner_repository.dart';
import 'package:webandcrafts/repository/product_repository.dart';
import 'models/category_model/category_model.dart';
import 'repository/category_repository.dart';
import 'repository/slider_repository.dart';
import 'view/home_page.dart';
import 'view_models/banner_view_model.dart';
import 'view_models/category_view_model.dart';
import 'view_models/product_view_model.dart';
import 'view_models/slider_view_model.dart';

void main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CategoryAdapter().typeId)) {
    Hive.registerAdapter(CategoryAdapter());
  }
  if (!Hive.isAdapterRegistered(ProductAdapter().typeId)) {
    Hive.registerAdapter(ProductAdapter());
  }
  if (!Hive.isAdapterRegistered(SingleBannerAdapter().typeId)) {
    Hive.registerAdapter(SingleBannerAdapter());
  }
  if (!Hive.isAdapterRegistered(SliderBannerAdapter().typeId)) {
    Hive.registerAdapter(SliderBannerAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SingleBannerViewModel>(
          create: (_) => SingleBannerViewModel(BannerRepository(Dio())),
        ),
        ChangeNotifierProvider<SliderBannerViewModel>(
          create: (_) => SliderBannerViewModel(SliderRepository(Dio())),
        ),
        ChangeNotifierProvider<CategoryViewModel>(
          create: (_) => CategoryViewModel(CategoryRepository(Dio())),
        ),
        ChangeNotifierProvider<ProductViewModel>(
          create: (_) => ProductViewModel(ProductRepository(Dio())),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WebandCrafts',
        home: RootPage(),
      ),
    );
  }
}
