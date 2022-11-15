import 'package:flutter/foundation.dart';

class childCategories {
  String childCatId;
  String childCategoryName2;
  String catId;
  String subCatId;
  String image;
  String status;
  DateTime createdDate;
  DateTime updatedDate;
  String deleted;
  String sort;

  childCategories({
    required this.childCatId,
    required this.childCategoryName2,
    required this.catId,
    required this.subCatId,
    required this.image,
    required this.status,
    required this.createdDate,
    required this.updatedDate,
    required this.deleted,
    required this.sort,
  });

  factory childCategories.fromJson(Map<String, dynamic> json) =>
      childCategories(
        childCatId: json["child_cat_id"],
        childCategoryName2: json["child_category_name"],
        catId: json["cat_id"],
        subCatId: json["sub_cat_id"],
        image: json["image"],
        status: json["status"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
        deleted: json["deleted"],
        sort: json["sort"],
      );

  Map<String, dynamic> toJson() => {
        "child_cat_id": childCatId,
        "child_category_name": childCategoryName2,
        "sub_cat_id": subCatId,
        "cat_id": catId,
        "image": image,
        "status": status,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate.toIso8601String(),
        "deleted": deleted,
        "sort": sort,
      };
  @override
  String toString() {
    return toJson().toString();
  }
}
