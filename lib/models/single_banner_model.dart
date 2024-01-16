class SingleBanner {
  String imageUrl;

  SingleBanner({
    required this.imageUrl,
  });

  factory SingleBanner.fromJson(Map<String, dynamic> json) {
    return SingleBanner(
      imageUrl: json['image_url'],
    );
  }
}
