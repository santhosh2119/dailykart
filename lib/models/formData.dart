// To parse required this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

// Categories categoriesFromJson(String str) =>
//     Categories.fromJson(json.decode(str));

// String categoriesToJson(Categories data) => json.encode(data.toJson());

class AddtoCartForm {
  AddtoCartForm({
    required this.productId,
    required this.categoryName,
    required this.productPrice,
    required this.productmrp,
    required this.productQuantity,
  });

  String productId;
  String categoryName;
  String productPrice;
  String productmrp;
  String productQuantity;

  factory AddtoCartForm.fromJson(Map<String, dynamic> json) => AddtoCartForm(
      productId: json["productId"],
      categoryName: json["category_name"],
      productPrice: json["productPrice"],
      productQuantity: json["productQuantity"],
      productmrp: json["productmrp"]);

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "category_name": categoryName,
        "productPrice": productPrice,
        "productQuantity": productQuantity,
        "productmrp": productmrp
      };
  @override
  String toString() {
    return toJson().toString();
  }
}
