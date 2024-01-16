class SliderBanner {
  String type;
  String title;
  List<String> imageUrls;
  String id;

  SliderBanner({
    required this.type,
    required this.title,
    required this.imageUrls,
    required this.id,
  });

  factory SliderBanner.fromJson(Map<String, dynamic> json) {
    return SliderBanner(
      type: json['type'],
      title: json['title'],
      imageUrls: (json['contents'] as List)
          .map((content) => content['image_url'] as String)
          .toList(),
      id: json['id'],
    );
  }
}
