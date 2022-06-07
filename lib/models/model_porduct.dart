// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

import 'dart:core';

import 'package:get/get.dart';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));


class Product {
  Product({
    this.id,
    this.brand,
    this.name,
    this.price,
    this.priceSign,
    this.currency,
    this.imageLink,
    this.productLink,
    this.websiteLink,
    this.description,
    this.rating,
    this.category,
    this.productType,
    this.tagList,
    this.createdAt,
    this.updatedAt,
    this.productApiUrl,
    this.apiFeaturedImage,
    this.productColors,
  });

  int? id;
  String? brand;
  String? name;
  String? price;
  PriceSign? priceSign;
  Currency? currency;
  String? imageLink;
  String? productLink;
  String? websiteLink;
  String? description;
  double? rating;
  Category? category;
  ProductType? productType;
  List<String>? tagList;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? productApiUrl;
  String? apiFeaturedImage;
  List<ProductColor>? productColors;
  var isFavourite=false.obs;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    brand: json["brand"],
    name: json["name"],
    price: json["price"],
    priceSign: json["price_sign"] == null ? null : priceSignValues.map![json["price_sign"]],
    currency: json["currency"] == null ? null : currencyValues.map![json["currency"]],
    imageLink: json["image_link"],
    productLink: json["product_link"],
    websiteLink: json["website_link"],
    description: json["description"],
    rating: json["rating"] == null ? null : json["rating"].toDouble(),
    category: json["category"] == null ? null : categoryValues.map![json["category"]],
    productType: productTypeValues.map![json["product_type"]],
    tagList: List<String>.from(json["tag_list"].map((x) => x)),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    productApiUrl: json["product_api_url"],
    apiFeaturedImage: json["api_featured_image"],
    productColors: List<ProductColor>.from(json["product_colors"].map((x) => ProductColor.fromJson(x))),
  );

}

enum Category { POWDER, CREAM }

final categoryValues = EnumValues({
  "cream": Category.CREAM,
  "powder": Category.POWDER
});

enum Currency { USD, GBP }

final currencyValues = EnumValues({
  "GBP": Currency.GBP,
  "USD": Currency.USD
});

enum PriceSign { EMPTY, PRICE_SIGN }

final priceSignValues = EnumValues({
  "\u0024": PriceSign.EMPTY,
  "£": PriceSign.PRICE_SIGN
});

class ProductColor {
  ProductColor({
    this.hexValue,
    this.colourName,
  });

  String? hexValue;
  String? colourName;

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
    hexValue: json["hex_value"],
    colourName: json["colour_name"] == null ? null : json["colour_name"],
  );


}

enum ProductType { BLUSH }

final productTypeValues = EnumValues({
  "blush": ProductType.BLUSH
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
