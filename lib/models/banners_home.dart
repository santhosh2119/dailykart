// To parse required this JSON data, do
//
//     final banners = bannersFromJson(jsonString);

import 'dart:convert';

BannersHome bannersFromJson(String str) =>
    BannersHome.fromJson(json.decode(str));

String bannersToJson(BannersHome data) => json.encode(data.toJson());

class BannersHome {
  BannersHome({
    required this.id,
    required this.sortBy,
    required this.images,
    required this.description,
    required this.link,
    required this.target,
    required this.updatedDate,
    required this.createdBy,
    required this.updatedBy,
    required this.createdDate,
    required this.deleted,
    required this.status,
    required this.bannerType,
    required this.bannerValue,
  });

  String id;
  String sortBy;
  String images;
  String description;
  String link;
  String target;
  String updatedDate;
  String createdBy;
  String updatedBy;
  DateTime createdDate;
  String deleted;
  String status;
  String bannerType;
  dynamic bannerValue;

  factory BannersHome.fromJson(Map<String, dynamic> json) => BannersHome(
        id: json["id"],
        sortBy: json["sort_by"],
        images: json["images"],
        description: json["description"],
        link: json["link"],
        target: json["target"],
        updatedDate: json["updated_date"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdDate: DateTime.parse(json["created_date"]),
        deleted: json["deleted"],
        status: json["status"],
        bannerType: json["banner_type"],
        bannerValue: json["banner_value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sort_by": sortBy,
        "images": images,
        "description": description,
        "link": link,
        "target": target,
        "updated_date": updatedDate,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_date":
            "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
        "deleted": deleted,
        "status": status,
        "banner_type": bannerType,
        "banner_value": bannerValue,
      };
  @override
  String toString() {
    return toJson().toString();
  }
}