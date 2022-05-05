// To parse this JSON data, do
//
//     final subCategories = subCategoriesFromJson(jsonString);

import 'dart:convert';

SubCategories subCategoriesFromJson(String str) =>
    SubCategories.fromJson(json.decode(str));

String subCategoriesToJson(SubCategories data) => json.encode(data.toJson());

class SubCategories {
  SubCategories({
    required this.subCatId,
    required this.subCategoryName,
    required this.catId,
    required this.image,
    required this.status,
    required this.createdDate,
    required this.updatedDate,
    required this.deleted,
    required this.sort,
    required this.childCategories,
    required this.childCatId,
  });

  String subCatId;
  String subCategoryName;
  String catId;
  String image;
  String status;
  DateTime createdDate;
  DateTime updatedDate;
  String deleted;
  String sort;
  List<dynamic> childCategories;
  String childCatId;

  factory SubCategories.fromJson(Map<String, dynamic> json) => SubCategories(
        subCatId: json["sub_cat_id"],
        subCategoryName: json["sub_category_name"],
        catId: json["cat_id"],
        image: json["image"],
        status: json["status"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
        deleted: json["deleted"],
        sort: json["sort"],
        childCategories: List<dynamic>.from(
            json["child_categories"].map((x) => SubCategories.fromJson(x))),
        childCatId: json["child_cat_id"],
      );

  Map<String, dynamic> toJson() => {
        "sub_cat_id": subCatId,
        "sub_category_name": subCategoryName,
        "cat_id": catId,
        "image": image,
        "status": status,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate.toIso8601String(),
        "deleted": deleted,
        "sort": sort,
        "child_categories":
            List<dynamic>.from(childCategories.map((x) => x.toJson())),
        "child_cat_id": childCatId,
      };
  @override
  String toString() {
    return toJson().toString();
  }
}
