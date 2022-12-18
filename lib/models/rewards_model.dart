import 'dart:convert';

class RewardsModel {
  RewardsModel({
    this.id,
    this.name,
    this.description,
    this.requiredPoint,
    this.validUntil,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.category,
  });

  int? id;
  String? name;
  String? description;
  int? requiredPoint;
  String? validUntil;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Category? category;

  factory RewardsModel.fromJson(Map<String, dynamic> json) => RewardsModel(
        id: json["id"],
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        requiredPoint: json["required_points"],
        validUntil: json["valid_until"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        deletedAt: json["deleted_at"] ?? '',
        category: Category.fromJson(json["category"] ?? {}),
      );
}

class Category {
  Category({
    this.id,
    this.name,
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
        id: json["id"],
        name: json["name"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
      );
}

String redeemModelToJson(RedeemModel data) => json.encode(data.toJson());

class RedeemModel {
  RedeemModel({
    required this.rewardId,
  });

  int rewardId;

  Map<String, dynamic> toJson() => {
        "reward_id": rewardId,
      };
}
