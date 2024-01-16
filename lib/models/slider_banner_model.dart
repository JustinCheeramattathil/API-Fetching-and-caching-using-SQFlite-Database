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
}
