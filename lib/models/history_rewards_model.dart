import 'dart:convert';

HistoryRewardsModel historyRewardsModelFromJson(String str) =>
    HistoryRewardsModel.fromJson(json.decode(str));

class HistoryRewardsModel {
  HistoryRewardsModel({
    this.id,
    this.pointSpent,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.reward,
  });

  int? id;
  int? pointSpent;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Reward? reward;

  factory HistoryRewardsModel.fromJson(Map<String, dynamic> json) =>
      HistoryRewardsModel(
        id: json["id"],
        pointSpent: json["point_spent"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        reward: Reward.fromJson(json["reward"]),
      );
}

class Reward {
  Reward({
    this.id,
    this.name,
    this.description,
    this.requiredPoints,
    this.validUntil,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.category,
  });

  int? id;
  String? name;
  String? description;
  int? requiredPoints;
  String? validUntil;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Category? category;

  factory Reward.fromJson(Map<String, dynamic> json) => Reward(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        requiredPoints: json["required_points"],
        validUntil: json["valid_until"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        category: Category.fromJson(json["category"]),
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
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );
}
