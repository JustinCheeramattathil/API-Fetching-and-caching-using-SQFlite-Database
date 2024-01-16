import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webandcrafts/repository/banner_repository.dart';
import 'package:webandcrafts/repository/product_repository.dart';
import 'package:webandcrafts/view/home_page.dart';

import 'repository/category_repository.dart';
import 'repository/slider_repository.dart';
import 'view_models/banner_view_model.dart';
import 'view_models/category_view_model.dart';
import 'view_models/product_view_model.dart';
import 'view_models/slider_view_model.dart';

void main() {
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
        home: HomePage(),
      ),
    );
  }
}
