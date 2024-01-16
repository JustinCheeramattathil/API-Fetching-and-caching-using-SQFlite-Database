import 'package:hive/hive.dart';
part 'single_banner_model.g.dart';

@HiveType(typeId: 0)
class SingleBanner {
  @HiveField(0)
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
