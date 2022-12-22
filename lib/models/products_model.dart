import 'dart:convert';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

class ProductsModel {
  ProductsModel({
    this.id,
    this.name,
    this.description,
    this.provider,
    this.activePeriod,
    this.price,
    this.minimumTransaction,
    this.coins,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.category,
  });

  int? id;
  String? name;
  String? description;
  String? provider;
  int? activePeriod;
  int? price;
  int? minimumTransaction;
  int? coins;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Category? category;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        provider: json["provider"] ?? '',
        activePeriod: json["active_period"] ?? 0,
        price: json["price"] ?? 0,
        minimumTransaction: json["minimum_transaction"] ?? 0,
        coins: json["coins"] ?? 0,
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        deletedAt: json["deleted_at"] ?? '',
        category: json["category"] != null
            ? Category.fromJson(json["category"])
            : Category.fromJson({}),
      );
}

class Category {
  Category({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        deletedAt: json["deleted_at"] ?? '',
      );
}
