// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) => AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
    AddressModel({
        required this.userId,
        required this.address,
    });

    String userId;
    String address;

    factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        userId: json["userId"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "address": address,
    };
}
