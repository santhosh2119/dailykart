// To parse required this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

// Categories categoriesFromJson(String str) =>
//     Categories.fromJson(json.decode(str));

// String categoriesToJson(Categories data) => json.encode(data.toJson());


class Categories {
  Categories({
    required this.id,
    required this.categoryName,
    required this.brandName,
    required this.image,
    required this.status,
    required this.createdDate,
    required this.updatedDate,
    required this.deleted,
    required this.sort,
    required this.subCategories,
  });

  String id;
  String categoryName;
  String brandName;
  String image;
  String status;
  DateTime createdDate;
  DateTime updatedDate;
  String deleted;
  String sort;
  List<dynamic> subCategories;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        categoryName: json["category_name"],
        brandName: json["brand_name"],
        image: json["image"],
        status: json["status"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
        deleted: json["deleted"],
        sort: json["sort"],
        subCategories:
            List<dynamic>.from(json["sub_categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "brand_name": brandName,
        "image": image,
        "status": status,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate.toIso8601String(),
        "deleted": deleted,
        "sort": sort,
        "sub_categories": List<dynamic>.from(subCategories.map((x) => x)),
      };
  @override
  String toString() {
    return toJson().toString();
  }
}
