import 'dart:convert';

FaqModel faqModelFromJson(String str) => FaqModel.fromJson(json.decode(str));

class FaqModel {
  FaqModel({
    this.id,
    this.question,
    this.answer,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? question;
  String? answer;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
        id: json["id"] ?? 0,
        question: json["question"] ?? '',
        answer: json["answer"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        deletedAt: json["deleted_at"] ?? '',
      );
}
