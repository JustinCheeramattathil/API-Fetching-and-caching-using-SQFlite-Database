class SingleBanner {
  String type;
  String title;
  String imageUrl;
  String id;

  SingleBanner({
    required this.type,
    required this.title,
    required this.imageUrl,
    required this.id,
  });

  factory SingleBanner.fromJson(Map<String, dynamic> json) {
    return SingleBanner(
      type: json['type'],
      title: json['title'],
      imageUrl: json['image_url'],
      id: json['id'],
    );
  }
}