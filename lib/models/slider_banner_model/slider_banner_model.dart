import 'package:hive/hive.dart';
part 'slider_banner_model.g.dart';

@HiveType(typeId: 0)
class SliderBanner {
  @HiveField(0)
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
