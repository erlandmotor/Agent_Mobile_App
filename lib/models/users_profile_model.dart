import 'dart:convert';

AccountModel accountModelFromJson(String str) =>
    AccountModel.fromJson(json.decode(str));

String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
  AccountModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
  });

  String? id;
  String? name;
  String? email;
  String? mobileNumber;
  String? createdAt;
  String? updatedAt;
  Role? role;

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        id: json["id"].toString(),
        name: json["name"].toString(),
        email: json["email"] ?? '',
        mobileNumber: json["mobile_number"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        role: Role.fromJson(json["role"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile_number": mobileNumber,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "role": role!.toJson(),
      };
}

class Role {
  Role({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  String? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"].toString(),
        name: json["name"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
