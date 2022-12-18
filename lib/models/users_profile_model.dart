class AccountModel {
  AccountModel({
    this.id,
    this.name,
    this.email,
    this.mobileNumber,
    this.userCoin,
    this.credit,
  });

  String? id;
  String? name;
  String? email;
  String? mobileNumber;
  String? createdAt;
  String? updatedAt;
  Credit? userCoin;
  Credit? credit;

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        mobileNumber: json["mobile_number"] ?? '',
        userCoin: json["user_coin"] != null
            ? Credit.fromJson(json["user_coin"])
            : Credit.fromJson({}),
        credit: json["credit"] != null
            ? Credit.fromJson(json["credit"])
            : Credit.fromJson({}),
      );
}

class Credit {
  Credit({
    this.id,
    this.amount,
  });

  int? id;
  int? amount;

  factory Credit.fromJson(Map<String, dynamic> json) => Credit(
        id: json["id"] ?? 0,
        amount: json["amount"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
      };
}
