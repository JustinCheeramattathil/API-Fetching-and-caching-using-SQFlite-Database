import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/slider_view_model.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return Consumer<SliderBannerViewModel>(
              builder: (context, value, child) {
                if (value.isLoading) {
                  return const CircularProgressIndicator();
                } else if (value.sliderBanner == null) {
                  value.fetchSliderBanner();

                  return const Text('No data available');
                } else {
                  return CarouselSlider(
                    items: value.sliderBanner!
                        .map(
                          (e) => Container(
                            height: size.height * 0.19,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(e.imageUrls),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      height: size.height * 0.19,
                      enlargeCenterPage: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: true,
                      onPageChanged: (index, reason) {},
                    ),
                  );
                }
              },
            );
  }
}