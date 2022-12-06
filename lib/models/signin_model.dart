import 'dart:convert';

modelSignInToJson(ModelSignin data) => json.encode(data.toJson());

class ModelSignin {
  ModelSignin({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
