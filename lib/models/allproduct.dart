// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.product,
  });

  List<Product> product;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.categoryName,
    required this.productName,
    required this.pDescription,
    required this.quentity,
    required this.price,
    required this.size,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String categoryName;
  String productName;
  String? pDescription;
  String quentity;
  String price;
  String? size;
  String? image;
  DateTime createdAt;
  DateTime updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        categoryName: json["category_name"],
        productName: json["product_name"],
        pDescription: json["p_description"],
        quentity: json["quentity"],
        price: json["price"],
        size: json["size"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "product_name": productName,
        "p_description": pDescription,
        "quentity": quentity,
        "price": price,
        "size": size,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
