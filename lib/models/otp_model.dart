import 'dart:convert';

String verificationEmailToJson(VerificationEmailModel data) =>
    json.encode(data.toJson());

class VerificationEmailModel {
  VerificationEmailModel({
    required this.email,
    required this.otp,
  });

  String email;
  String otp;

  Map<String, dynamic> toJson() => {
        "email": email,
        "otp": otp,
      };
}

String resendOtpModelToJson(ResendOtpModel data) => json.encode(data.toJson());

class ResendOtpModel {
  ResendOtpModel({
    required this.email,
  });

  String email;

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
