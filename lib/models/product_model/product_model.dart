import 'package:hive/hive.dart';
part 'product_model.g.dart';
@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  final String productName;
  @HiveField(1)
  final String productImage;
  @HiveField(2)
  final int productRating;
  @HiveField(3)
  final String actualPrice;
  @HiveField(4)
  final String offerPrice;
  @HiveField(5)
  final String discount;

  Product({
    required this.productName,
    required this.productImage,
    required this.productRating,
    required this.actualPrice,
    required this.offerPrice,
    required this.discount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['product_name'],
      productImage: json['product_image'],
      productRating: json['product_rating'],
      actualPrice: json['actual_price'],
      offerPrice: json['offer_price'],
      discount: json['discount'],
    );
  }
}
