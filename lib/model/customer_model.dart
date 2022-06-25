// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

CustomerModel customerModelFromJson(String str) => CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
    CustomerModel({
        this.id,
        this.type,
        this.cart,
        this.orders,
        this.balance,
        this.address,
        required this.name,
        required this.phone,
        this.deposit,
        this.notification,
        this.setting,
      
        
    });

    String? id;
    String? type;
    Cart? cart;
    Cart? orders;
    int? balance;
    List<String>? address;
    String name;
    String phone;
    List<Deposit>? deposit;
    List<Notification>? notification;
    Setting? setting;


    factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json["_id"],
        type:json["type"],
        cart: Cart.fromJson(json["cart"]),
        orders: Cart.fromJson(json["orders"]),
        balance: json["balance"],
        address: List<String>.from(json["address"].map((x) => x)),
        name: json["name"],
        phone: json["phone"],
        deposit: List<Deposit>.from(json["deposit"].map((x) => Deposit.fromJson(x))),
        notification: List<Notification>.from(json["notification"].map((x) => Notification.fromJson(x))),
        setting: Setting.fromJson(json["setting"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "type":type,
        "cart": cart!.toJson(),
        "orders": orders!.toJson(),
        "balance": balance,
        "address": List<dynamic>.from(address!.map((x) => x)),
        "name": name,
        "phone": phone,
        "deposit": List<dynamic>.from(deposit!.map((x) => x.toJson())),
        "notification": List<dynamic>.from(notification!.map((x) => x.toJson())),
        "setting": setting!.toJson(),
    };
}

class Cart {
    Cart({
         required this.productId,
    });

    List<String> productId;

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        productId: List<String>.from((json["productId"]?? []).map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "productId": List<dynamic>.from(productId.map((x) => x)),
    };
}

class Deposit {
    Deposit({
        this.id,
        this.userId,
        this.invoiceImg,
        required this.dateTime,
    });

    String? id;
    String? userId;
    String? invoiceImg;
    DateTime dateTime;

    factory Deposit.fromJson(Map<String, dynamic> json) => Deposit(
        id: json["_id"],
        userId: json["userId"],
        invoiceImg: json["invoice_img"],
        dateTime: DateTime.parse(json["dateTime"]?? '1000-01-01 00:00:00Z'),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "invoice_img": invoiceImg,
        "dateTime": dateTime.toIso8601String(),
    };
}

class Notification {
    Notification({
        this.id,
        required this.dateTime,
        this.message,
    });

    String? id;
    DateTime dateTime;
    String? message;

    factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["_id"],
        dateTime: DateTime.parse(json["dateTime"]?? '1000-01-01 00:00:00Z'),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "dateTime": dateTime.toIso8601String(),
        "message": message,
    };
}

class Setting {
    Setting({
        this.language,
    });

    String? language;

    factory Setting.fromJson(Map<String, dynamic> json) => Setting(
        language: json["language"] ?? 'English',
    );

    Map<String, dynamic> toJson() => {
        "language": language,
    };
}
