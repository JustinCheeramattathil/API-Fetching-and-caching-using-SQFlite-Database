import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webandcrafts/widgets/custom_button.dart';

//It is the Main Item Card in homescreen contains sales offer,star rating,and current market rate etc.
class CategoryCard extends StatelessWidget {
  final String productName;//specifies Product name
  final String productImage;//Specifies Product images from API
  final int productRating;//Specifies the Product Rating
  final String actualPrice;//Specifies the current price
  final String offerPrice;//Specifies the  offer price of the product
  final String discount;//Specifies the discount
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
              CustomButton(
                text: discount,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                productName,
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
              Row(
                children: [
                  Text(offerPrice),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    actualPrice,
                    style: const TextStyle(
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
