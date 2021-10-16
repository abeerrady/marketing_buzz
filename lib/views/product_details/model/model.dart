// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) => ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) => json.encode(data.toJson());

class ProductDetailsModel {
  ProductDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  dynamic message;
  Data data;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.inFavorites,
    this.inCart,
    this.images,
  });

  int id;
  int price;
  int oldPrice;
  int discount;
  String image;
  String name;
  String description;
  bool inFavorites;
  bool inCart;
  List<String> images;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      id: json["id"],
      price: json["price"],
      oldPrice: json["old_price"],
      discount: json["discount"],
      image: json["image"],
      name: json["name"],
      description: json["description"],
      inFavorites: json["in_favorites"],
      inCart: json["in_cart"],
      images: json["images"] == null ? [] : List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "old_price": oldPrice,
    "discount": discount,
    "image": image,
    "name": name,
    "description": description,
    "in_favorites": inFavorites,
    "in_cart": inCart,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}