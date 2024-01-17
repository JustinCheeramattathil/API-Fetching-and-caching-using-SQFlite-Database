class Product {
  final String productName;
  final String productImage;
  final int productRating;
  final String actualPrice;
  final String offerPrice;
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
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productName: map['product_name'],
      productImage: map['product_image'],
      productRating: map['product_rating'],
      actualPrice: map['actual_price'],
      offerPrice: map['offer_price'],
      discount: map['discount'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productImage': productImage,
      'productRating': productRating,
      'actualPrice': actualPrice,
      'offerPrice': offerPrice,
      'discount': discount
    };
  }
}
