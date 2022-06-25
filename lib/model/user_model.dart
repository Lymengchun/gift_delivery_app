// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.phone,
        required this.name,
    });

    String phone;
    String name;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        phone: json["phone"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "phone": phone,
        "name": name,
    };
}
