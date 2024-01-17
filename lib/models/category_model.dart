class Category {
  final String title;
  final String imageUrl;

  Category({
    required this.title,
    required this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      title: json['title'],
      imageUrl: json['image_url'],
    );
  }
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      title: map['title'],
      imageUrl: map['image_url'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image_url': imageUrl,
    };
  }
}
