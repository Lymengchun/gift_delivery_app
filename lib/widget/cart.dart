import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gift_delivery_app/admin%20page&staff/AdminModel/product_model.dart';
import 'package:gift_delivery_app/globalvar.dart';
import 'package:gift_delivery_app/language/english.dart';
import 'package:gift_delivery_app/model/add_product_tocart.dart';
import 'package:gift_delivery_app/widget/add_address.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  final Function? callback;
  const Cart({Key? key,this.callback}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

final controller = GroupButtonController();
List<ProductModel> _fetchProductCartList = [];

class _CartState extends State<Cart> {
 
  @override
  void initState() {
    
    super.initState();
    fetchProductCartList();
  }

  void fetchProductCartList() async {
    final res = await http
        .get(Uri.parse(urlEndpointEmu + "api/fetchProductFromCart/$userId"));
    if (res.statusCode == 200) {
      setState(() {
        _fetchProductCartList = productModelFromJson(res.body);
      
      });
      cartAmout = _fetchProductCartList.length;
      widget.callback;
    
    } else {
      throw Exception('Failed to load Product data.');
    }
  }

   Future<http.Response> removeProductIncart(idProduct) async {

       AddProductTocart addProductTocart = AddProductTocart(
                      userId: userId,
                      productId: idProduct.toString());

                  final res = await http.post(
                      Uri.parse(urlEndpointEmu + "api/removeProductIncart"),
                      headers: <String, String>{
                        'Content-Type': 'application/json'
                      },
                      body: jsonEncode(addProductTocart));

                  if (res.statusCode == 200) {
                    widget.callback!();
                    setState(() {
                      fetchProductCartList();
                    });
                    // ScaffoldMessenger.of(context)
                    //     .showSnackBar(const SnackBar(content: Text("removed")));
                  }
    return res;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: <Widget>[
            Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: Colors.black,
              appBar: appbar(context),
              body: Column(
                children: [
                  Expanded(child: listCart(context)),
                ],
              ),
              bottomNavigationBar: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                color: Colors.white12,
                child: Row(
                  children: [
                    Flexible(
                      flex: 4,
                      child: Row(
                        children: [
                          Radio(
                              value: null,
                              groupValue: null,
                              onChanged: (Null? value) {}),
                          Text(
                            selectAll,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.black38,
                              child: Center(
                                child: Text(
                                  edit,
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                          ),
                          // const SizedBox(width: 5,),
                          Flexible(
                            flex: 7,
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white30,
                              child: Center(
                                child: Text(
                                  submission,
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
   
    );
  }

  appbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        cartTitle,
        style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                fontSize: 20,
                // fontWeight: FontWeight.w500,
                color: Colors.white)),
        // textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.black,
      foregroundColor: Colors.blue,
      elevation: 0,
    );
  }

  listCart(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        SizedBox(
          height:(_fetchProductCartList.isNotEmpty)?3510:200,
          child: (_fetchProductCartList.isNotEmpty)?ListView.builder(
              itemCount: _fetchProductCartList.length,
              itemBuilder: (BuildContext context, index) {
                return cartList(context, _fetchProductCartList[index]);
              }):const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(child: Text(emptyCart,style: TextStyle(color: Colors.white24,fontSize: 30),),),
              ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 40,
          width: 310,
          child: TextFormField(
            readOnly: true,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddAdress()));
            },
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.pin_drop,
                  color: Colors.white54,
                ),
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                fillColor: Colors.white12,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                hintText: deliveryTo,
                hintStyle: TextStyle(
                  color: Colors.white54,
                )),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          deliveryOn,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 40,
          width: 310,
          child: TextFormField(
            onTap: () {},
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                fillColor: Colors.white12,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                hintText: "16/12/2022",
                hintStyle: TextStyle(
                  color: Colors.white,
                )),
          ),
        ),
        SizedBox(height: 300, width: 300, child: deliveryTimePicker)
      ],
    );
  }



  cartList(BuildContext context, ProductModel fetchProductCartList) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 2),
     
          decoration: BoxDecoration(
              color: Colors.white12, borderRadius: BorderRadius.circular(8.0)),
          height: 100,
       
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        fetchProductCartList.item[0].itemImage,
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 200,
                  child: Text(
                    fetchProductCartList.productName,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 14, color: Colors.white)),
                  ),
                ),
              ),
              InkWell(
                onTap: ()  {
                   removeProductIncart(fetchProductCartList.productId);
                   widget.callback;
                },
                child:  Row(
                    children: const [
                      Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                    ],
                  ),
                
              )
            ],
          ),
        ),
        SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width - 50,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120),
              child: Text(
                '\$${fetchProductCartList.item[0].price}',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ]),
        ),
        Checkbox(
            value: true,
            onChanged: (bool? value) {
              setState(() {});
            })
      ],
    );
  }
}

Widget get deliveryTimePicker {
  return Column(
    children: [
      ListTile(
        title: const Text(
          "Stadart Delivery5\$",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Radio(
          groupValue: null,
          onChanged: (Null? value) {},
          value: null,
        ),
      ),
      ListTile(
        title: const Text(
          "Free Delivery free",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Radio(
          groupValue: null,
          onChanged: (Null? value) {},
          value: null,
        ),
      ),
      ListTile(
        title: const Text(
          "Fixed Time Deliver​y 50\$",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Radio(
          groupValue: null,
          onChanged: (Null? value) {},
          value: null,
        ),
      ),
      ListTile(
        title: const Text(
          "Mid Night Delivery 100\$",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Radio(
          groupValue: null,
          onChanged: (Null? value) {},
          value: null,
        ),
      )
    ],
  );
}
