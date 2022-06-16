

//---------------------------------------------------------------------------------------------------------------
// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';


List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
    ProductModel({
        required this.soldAmount,
        required this.productAmount,
        required this.catagories,
        this.postDate,
        required this.item,
        required this.starRating,
        required this.productName,
    });
    String productName;
    int soldAmount;
    int productAmount;
    String catagories;
    DateTime ?postDate;
    List<Item> item;
    List<dynamic> starRating;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        soldAmount: json["sold_amount"],
        productAmount: json["product_amount"],
        catagories: json["catagories"],
        postDate: DateTime.parse(json["post_date"]),
        productName: json["product_name"],
        
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
        starRating: List<dynamic>.from(json["star_rating"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "product_name":productName,
        "sold_amount": soldAmount,
        "product_amount": productAmount,
        "catagories": catagories,
        "post_date": postDate,
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
        "star_rating": List<dynamic>.from(starRating.map((x) => x)),
    };
}

class Item {
    Item({
        required this.itemImage,
         required this.price,
        required this.name,
    });

    String itemImage;
    double price;
    String name;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemImage: json["item_image"],
        price: json["price"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "item_image": itemImage,
        "price":price.toDouble() ,
        "name": name,
    };
}
