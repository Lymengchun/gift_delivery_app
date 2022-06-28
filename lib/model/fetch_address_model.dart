//
//     final fetchAddressModel = fetchAddressModelFromJson(jsonString);

import 'dart:convert';

FetchAddressModel fetchAddressModelFromJson(String str) => FetchAddressModel.fromJson(json.decode(str));

String fetchAddressModelToJson(FetchAddressModel data) => json.encode(data.toJson());

class FetchAddressModel {
    FetchAddressModel({
        required this.address,
    });

    List<String> address;

    factory FetchAddressModel.fromJson(Map<String, dynamic> json) => FetchAddressModel(
        address: List<String>.from(json["address"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "address": List<dynamic>.from(address.map((x) => x)),
    };
}
