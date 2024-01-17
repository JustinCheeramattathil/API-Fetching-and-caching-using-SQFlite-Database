import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webandcrafts/view_models/banner_view_model.dart';
import 'package:webandcrafts/view_models/category_view_model.dart';
import 'package:webandcrafts/view_models/product_view_model.dart';
import 'package:webandcrafts/widgets/carousel_slider.dart';
import 'package:webandcrafts/widgets/category_card.dart';
import 'package:webandcrafts/widgets/category_widget.dart';
import 'package:webandcrafts/widgets/upper_ui_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const UpperUiComponent(),
            const Carousel(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Most Popular',
                    style: GoogleFonts.poppins(fontSize: 20),
                  ),
                  Text(
                    'View all',
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 280,
              width: double.infinity,
              child:
                  Consumer<ProductViewModel>(builder: (context, value, child) {
                if (value.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (value.products == null) {
                  value.fetchProducts();

                  return const Text('No data available');
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.products!.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: CategoryCard(
                          actualPrice: value.products![index].actualPrice,
                          discount: value.products![index].discount,
                          offerPrice: value.products![index].offerPrice,
                          productImage: value.products![index].productImage,
                          productName: value.products![index].productName,
                          productRating: value.products![index].productRating,
                        ),
                      );
                    },
                  );
                }
              }),
            ),
            Consumer<SingleBannerViewModel>(
              builder: (context, value, _) {
                if (value.isLoading) {
                  return const CircularProgressIndicator();
                } else if (value.singleBanner == null) {
                  value.fetchSingleBanner();
                  return const Text('No data available');
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 170,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: NetworkImage(value.singleBanner!.imageUrl),
                            fit: BoxFit.cover),
                      ),
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.poppins(fontSize: 20),
                  ),
                  Text(
                    'View all',
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Consumer<CategoryViewModel>(
                builder: (context, viewmodel, child) {
                  if (viewmodel.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (viewmodel.categories == null) {
                    viewmodel.fetchCategories();
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: viewmodel.categories!.length,
                      itemBuilder: (context, index) {
                        var category = viewmodel.categories![index];
                        return Center(
                          child: CategoryWidget(
                            text: category.title,
                            imageUrl: category.imageUrl,
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                      child: Text('Failed to load categories.'));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured Products',
                    style: GoogleFonts.poppins(fontSize: 20),
                  ),
                  Text(
                    'View all',
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 280,
              width: double.infinity,
              child: Consumer<ProductViewModel>(builder: (context, value, _) {
                if (value.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (value.products == null) {
                  value.fetchProducts();
                  return const Text('No data available');
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.products!.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: CategoryCard(
                          actualPrice: value.products![index].actualPrice,
                          discount: value.products![index].discount,
                          offerPrice: value.products![index].offerPrice,
                          productImage: value.products![index].productImage,
                          productName: value.products![index].productName,
                          productRating: value.products![index].productRating,
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    ));
  }
}
