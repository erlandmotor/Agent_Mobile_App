import 'dart:convert';

modelSignUpToJson(ModelSignUp data) => json.encode(data.toJson());

class ModelSignUp {
  ModelSignUp({
    required this.name,
    required this.email,
    required this.password,
    required this.mobileNumber,
  });

  String name;
  String email;
  String password;
  String mobileNumber;

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "mobile_number": mobileNumber,
      };
}
