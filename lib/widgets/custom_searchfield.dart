import 'package:flutter/material.dart';
import 'package:webandcrafts/utils/colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 40,
      width: size.width * 0.65,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 102, 102, 102).withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 2,
          offset: const Offset(0, 3), 
        ),
      ], color: scaffoldColor, borderRadius: BorderRadius.circular(15)),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: bottomiconColor,
            ),
          ),
        ],
      ),
    );
  }
}
