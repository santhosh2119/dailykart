import 'dart:convert';

HomeBanners homeBannersFromJson(String str) =>
HomeBanners.fromJson(json.decode(str));

String homeBannersToJson(HomeBanners data) => json.encode(data.toJson());
class HomeBanners {
  HomeBanners({
    required this.images,
  });
  String images;

  factory HomeBanners.fromJson(Map<String, dynamic> json) => HomeBanners(
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "images": images,
      };
      @override
  String toString() {
    return toJson().toString();
  }
}
