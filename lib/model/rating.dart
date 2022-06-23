// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';

Rating ratingFromJson(String str) => Rating.fromJson(json.decode(str));

String ratingToJson(Rating data) => json.encode(data.toJson());

class Rating {
    Rating({
        this.userId,
        this.productId,
        this.star,
    });

    String? userId;
    String? productId;
    double? star;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        userId: json["userId"],
        productId: json["productId"],
        star: json["star"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "productId": productId,
        "star": star,
    };
}
