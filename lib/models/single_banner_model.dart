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
  factory SingleBanner.fromMap(Map<String, dynamic> map) {
    return SingleBanner(
      imageUrl: map['image'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': imageUrl,
    };
  }
}
