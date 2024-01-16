import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:webandcrafts/utils/colors.dart';
import 'package:webandcrafts/view/screens/cart_screen.dart';
import 'package:webandcrafts/view/screens/category_screen.dart';
import 'package:webandcrafts/view/screens/home_screen.dart';
import 'package:webandcrafts/view/screens/offer_screen.dart';
import 'package:webandcrafts/view/screens/profile_screen.dart';

class RootPage extends StatelessWidget {
  RootPage({super.key});

  List<Widget> widgets = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const OfferScreen(),
    const ProfileScreen(),
  ];
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: primaryColor,
        color: bottomnavColor,
        backgroundColor: scaffoldColor,
        items: [
          const CurvedNavigationBarItem(
            child: Icon(
              Icons.home_filled,
              color: bottomiconColor,
            ),
            label: 'Home',
          ),
          const CurvedNavigationBarItem(
            child: Icon(
              IconlyBold.category,
              color: bottomiconColor,
            ),
            label: 'Categories',
          ),
          const CurvedNavigationBarItem(
            child: Icon(
              Icons.shopping_cart,
              color: bottomiconColor,
            ),
            label: 'Cart',
          ),
          CurvedNavigationBarItem(
            child: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset('assets/images/offer.png')),
            label: 'Offer',
          ),
          const CurvedNavigationBarItem(
            child: Icon(
              Icons.person,
              color: bottomiconColor,
            ),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          currentIndex.value = index;
        },
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: currentIndex,
        builder: (context, index, child) {
          return IndexedStack(
            index: index,
            children: widgets,
          );
        },
      ),
    );
  }
}
