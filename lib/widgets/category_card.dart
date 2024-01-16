import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webandcrafts/view_models/product_view_model.dart';
import 'package:webandcrafts/widgets/custom_button.dart';

class CategoryCard extends StatelessWidget {
  final String productName;
  final String productImage;
  final int productRating;
  final String actualPrice;
  final String offerPrice;
  final String discount;
  const CategoryCard({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productRating,
    required this.actualPrice,
    required this.offerPrice,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 260,
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey.withOpacity(0.7), width: 2)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 110,
                width: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(productImage), fit: BoxFit.cover),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomButton(
                text: 'Sales 65% off',
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Motul 5100 10W40 4-Stroke Motor',
                style: GoogleFonts.poppins(
                    fontSize: 6, fontWeight: FontWeight.w500),
              ),
              Text(
                'cycle Engine Oil 1 Litre',
                style: GoogleFonts.poppins(
                    fontSize: 6, fontWeight: FontWeight.w500),
              ),
              const Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 253, 228, 2),
                  ),
                  Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 253, 228, 2),
                  ),
                  Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 253, 228, 2),
                  ),
                  Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 253, 228, 2),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.grey,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text('₹100'),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '₹200',
                    style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.grey,
                      decorationThickness: 2.0,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
