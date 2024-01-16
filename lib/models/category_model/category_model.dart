import 'package:hive/hive.dart';
part 'category_model.g.dart';

@HiveType(typeId: 0)
class Category {
  @HiveField(0)
  final String title;
  @HiveField(1)
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
}
