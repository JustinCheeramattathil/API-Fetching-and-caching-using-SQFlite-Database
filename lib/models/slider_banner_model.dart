class SliderBanner {
  String imageUrls;

  SliderBanner({
    required this.imageUrls,
  });

  factory SliderBanner.fromJson(Map<String, dynamic> json) {
    return SliderBanner(
      imageUrls: json['image_url'],
    );
  }
  factory SliderBanner.fromMap(Map<String, dynamic> map) {
    return SliderBanner(
      imageUrls: map['image_url'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'imageUrls': imageUrls,
    };
  }
}
