// To parse this JSON data, do
//
//     final addProductTocart = addProductTocartFromJson(jsonString);

import 'dart:convert';

AddProductTocart addProductTocartFromJson(String str) => AddProductTocart.fromJson(json.decode(str));

String addProductTocartToJson(AddProductTocart data) => json.encode(data.toJson());

class AddProductTocart {
    AddProductTocart({
        required this.userId,
        required this.productId,
    });

    String userId;
    String productId;

    factory AddProductTocart.fromJson(Map<String, dynamic> json) => AddProductTocart(
        userId: json["userId"],
        productId: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "productId": productId,
    };
}
