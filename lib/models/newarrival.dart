// To parse this JSON data, do
//
//     final newarrival = newarrivalFromJson(jsonString);

import 'dart:convert';

Newarrival newarrivalFromJson(String str) =>
    Newarrival.fromJson(json.decode(str));

String newarrivalToJson(Newarrival data) => json.encode(data.toJson());

class Newarrival {
  Newarrival({
    required this.id,
    required this.productId,
    required this.hsnCode,
    required this.productName,
    required this.productCategory,
    required this.productQuantity,
    required this.description,
    required this.link,
    required this.mImages,
    required this.brandname,
    required this.target,
    required this.location,
    required this.productImage,
    required this.productBannerImage,
    required this.status,
    required this.vendor,
    required this.msl,
    required this.mslOld,
    required this.taxClass,
    required this.assignedTo,
    required this.createdDate,
    required this.updatedDate,
    required this.deleted,
    required this.productSubCategory,
    required this.productChildCategory,
    required this.varientType,
    required this.categoryName,
    required this.subCategoryName,
    required this.childCategoryName,
    required this.productPrice,
    required this.isWishlist,
  });

  String id;
  String productId;
  String hsnCode;
  String productName;
  String productCategory;
  String productQuantity;
  String description;
  String link;
  String mImages;
  String brandname;
  String target;
  String location;
  String productImage;
  String productBannerImage;
  String status;
  String vendor;
  String msl;
  dynamic mslOld;
  String taxClass;
  String assignedTo;
  DateTime createdDate;
  DateTime updatedDate;
  String deleted;
  String productSubCategory;
  String productChildCategory;
  String varientType;
  String categoryName;
  dynamic subCategoryName;
  dynamic childCategoryName;
  List<ProductPrice> productPrice;
  bool isWishlist;

  factory Newarrival.fromJson(Map<String, dynamic> json) => Newarrival(
        id: json["id"],
        productId: json["product_id"],
        hsnCode: json["hsn_code"],
        productName: json["product_name"],
        productCategory: json["product_category"],
        productQuantity: json["product_quantity"],
        description: json["description"],
        link: json["link"],
        mImages: json["mImages"],
        brandname: json["brandname"],
        target: json["target"],
        location: json["location"],
        productImage: json["product_image"],
        productBannerImage: json["product_banner_image"],
        status: json["status"],
        vendor: json["vendor"],
        msl: json["msl"],
        mslOld: json["msl_old"],
        taxClass: json["tax_class"],
        assignedTo: json["assigned_to"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
        deleted: json["deleted"],
        productSubCategory: json["product_sub_category"],
        productChildCategory: json["product_child_category"],
        varientType: json["varient_type"],
        categoryName: json["category_name"],
        subCategoryName: json["sub_category_name"],
        childCategoryName: json["child_category_name"],
        productPrice: List<ProductPrice>.from(
            json["product_price"].map((x) => ProductPrice.fromJson(x))),
        isWishlist: json["is_wishlist"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "hsn_code": hsnCode,
        "product_name": productName,
        "product_category": productCategory,
        "product_quantity": productQuantity,
        "description": description,
        "link": link,
        "mImages": mImages,
        "brandname": brandname,
        "target": target,
        "location": location,
        "product_image": productImage,
        "product_banner_image": productBannerImage,
        "status": status,
        "vendor": vendor,
        "msl": msl,
        "msl_old": mslOld,
        "tax_class": taxClass,
        "assigned_to": assignedTo,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate.toIso8601String(),
        "deleted": deleted,
        "product_sub_category": productSubCategory,
        "product_child_category": productChildCategory,
        "varient_type": varientType,
        "category_name": categoryName,
        "sub_category_name": subCategoryName,
        "child_category_name": childCategoryName,
        "product_price":
            List<dynamic>.from(productPrice.map((x) => x.toJson())),
        "is_wishlist": isWishlist,
      };
  @override
  String toString() {
    return toJson().toString();
  }
}

class ProductPrice {
  ProductPrice({
    required this.quantity,
    required this.originalprice,
    required this.sp,
    required this.lcp,
    required this.productsInStock,
    required this.cartQty,
    required this.discountPercentage,
  });

  String quantity;
  String originalprice;
  String sp;
  String lcp;
  String productsInStock;
  int cartQty;
  int discountPercentage;

  factory ProductPrice.fromJson(Map<String, dynamic> json) => ProductPrice(
        quantity: json["quantity"],
        originalprice: json["originalprice"],
        sp: json["sp"],
        lcp: json["lcp"],
        productsInStock: json["products_in_stock"],
        cartQty: json["cartQty"],
        discountPercentage: json["discount_percentage"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "originalprice": originalprice,
        "sp": sp,
        "lcp": lcp,
        "products_in_stock": productsInStock,
        "cartQty": cartQty,
        "discount_percentage": discountPercentage,
      };
  @override
  String toString() {
    return toJson().toString();
  }
}
