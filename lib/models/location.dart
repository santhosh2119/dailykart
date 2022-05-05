// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

class LocationModel {
  LocationModel({
    required this.id,
    required this.location,
    required this.deliveryCharges,
    required this.cutoffCharges,
    required this.image,
    required this.status,
    required this.deleted,
  });

  String id;
  String location;
  String deliveryCharges;
  String cutoffCharges;
  String image;
  String status;
  String deleted;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json["id"],
        location: json["location"],
        deliveryCharges: json["deliveryCharges"],
        cutoffCharges: json["cutoffCharges"],
        image: json["image"],
        status: json["status"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "location": location,
        "deliveryCharges": deliveryCharges,
        "cutoffCharges": cutoffCharges,
        "image": image,
        "status": status,
        "deleted": deleted,
      };
  @override
  String toString() {
    return toJson().toString();
  }
}
