import 'package:flutter/material.dart';

 //Shows the categories in the home Screen 
class CategoryWidget extends StatelessWidget {
  final String text;
  final String imageUrl;
  const CategoryWidget({super.key, required this.text, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 165,
        width: 187,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 3),
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            Container(
              height: 120,
              width: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
