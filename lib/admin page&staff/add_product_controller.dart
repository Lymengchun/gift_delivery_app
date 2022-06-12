import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gift_delivery_app/admin%20page&staff/AdminModel/product_model.dart';
import 'package:gift_delivery_app/globalvar.dart';
import 'package:http/http.dart' as http;


  


TextEditingController productNameController = TextEditingController();
TextEditingController productAmountController = TextEditingController();
TextEditingController productCatagoriesController = TextEditingController();
TextEditingController productItemController = TextEditingController();

TextEditingController itemImageController = TextEditingController();
TextEditingController itemPriceController = TextEditingController();
TextEditingController itemNameController = TextEditingController();



List<Item> listItemsController = [];
// List<TextEditingController> itemControllerList = [];


Future<http.Response> postSingleProduct()async{

  ProductModel productData = ProductModel(soldAmount:0, productAmount:int.parse(productAmountController.text) , catagories: productCatagoriesController.text, item: listItemsController, starRating: [], productName: productNameController.text);

  String jsonProductData = jsonEncode(productData);

  
  print('json data:${jsonProductData}');

    final res = await http.post(
    Uri.parse(urlEndpointEmu + "api/addProduct"),
    headers: <String, String>{'Content-Type': 'application/json'},
    body: jsonProductData,
  );
  print('error${res.body}');

  return res;
}


