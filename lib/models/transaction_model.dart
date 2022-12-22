import 'dart:convert';

TransactionModel transactionModelFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));

class TransactionModel {
  TransactionModel({
    this.id,
    this.userId,
    this.status,
    this.amount,
    this.productId,
    this.coinsEarned,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.product,
  });

  int? id;
  String? userId;
  String? status;
  int? amount;
  int? productId;
  int? coinsEarned;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Product? product;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? '',
        status: json["status"] ?? '',
        amount: json["amount"] ?? 0,
        productId: json["product_id"] ?? 0,
        coinsEarned: json["coins_earned"] ?? 0,
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        deletedAt: json["deleted_at"] ?? '',
        product: json["products"] != null
            ? Product.fromJson(json["products"])
            : Product.fromJson({}),
      );
}

class Product {
  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
    this.requiredPoint,
    this.validUntil,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  int? requiredPoint;
  String? validUntil;
  String? createdAt;
  String? updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        requiredPoint: json["required_point"] ?? 0,
        validUntil: json["valid_until"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
      );
}
