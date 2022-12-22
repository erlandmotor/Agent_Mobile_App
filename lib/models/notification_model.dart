import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

class NotificationModel {
  NotificationModel({
    this.id,
    this.type,
    this.title,
    this.desc,
  });

  int? id;
  String? type;
  String? title;
  String? desc;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        type: json["type"],
        title: json["title"],
        desc: json["desc"],
      );
}
