import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gift_delivery_app/admin%20page&staff/AdminModel/product_model.dart';
import 'package:gift_delivery_app/globalvar.dart';
import 'package:gift_delivery_app/language/english.dart';
import 'package:gift_delivery_app/model/add_product_tocart.dart';
import 'package:gift_delivery_app/model/rating.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

class ProductDetail extends StatefulWidget {
  final Function? callback;
  final ProductModel? allProduct;

  const ProductDetail({Key? key, this.allProduct, this.callback})
      : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late ProductModel _allProduct;
  List<ProductModel> _allProductList = [];
  late double _avgStar = 0.0;
  final catagroiesList = [
    'Cakes',
    'Flowers',
    'Fashion and Lifestyle Gifts',
    'Jewellery',
    'Toys & Games',
    'All'
  ];
  @override
  void initState() {
    super.initState();
    _allProduct = widget.allProduct!;
    
    if (_allProduct.catagories == catagroiesList[0]) {
      _fetchCakesCatagories();
    } else if (_allProduct.catagories == catagroiesList[1]) {
      _fetchFlowersCatagories();
    } else if (_allProduct.catagories == catagroiesList[2]) {
      _fetchFashionandLifestyleGiftsCatagories();
    } else if (_allProduct.catagories == catagroiesList[3]) {
      _fetchJewelleryCatagories();
    } else {
      _fetchToysnGamesCatagories();
    }

    _fetchAvgStar();
  }

  void _fetchAvgStar() async {
    final res =
        await http.get(Uri.parse(urlEndpointEmu + "api/avgStar/${_allProduct.productId}"));
    if (res.statusCode == 200) {
      setState(() {
        _avgStar =jsonDecode(res.body)[0]['averageStar'];
      });
      // print(jsonDecode(res.body)[0]['averageStar']);
 
    } else {
      throw Exception('Failed to load Product data.');
    }
  }

  void _fetchCakesCatagories() async {
    final res =
        await http.get(Uri.parse(urlEndpointEmu + "api/fetchCakesCatagories"));
    if (res.statusCode == 200) {
      setState(() {
        _allProductList = productModelFromJson(res.body);
        _allProductList.removeWhere(
            (element) => element.productId == _allProduct.productId);
      });
    } else {
      throw Exception('Failed to load Product data.');
    }
  }

  void _fetchFlowersCatagories() async {
    final res = await http
        .get(Uri.parse(urlEndpointEmu + "api/fetchFlowersCatagories"));
    if (res.statusCode == 200) {
      setState(() {
        _allProductList = productModelFromJson(res.body);
        _allProductList.removeWhere(
            (element) => element.productId == _allProduct.productId);
      });
    } else {
      throw Exception('Failed to load Product data.');
    }
  }

  void _fetchFashionandLifestyleGiftsCatagories() async {
    final res = await http.get(Uri.parse(
        urlEndpointEmu + "api/fetchFashionandLifestyleGiftsCatagories"));
    if (res.statusCode == 200) {
      setState(() {
        _allProductList = productModelFromJson(res.body);
        _allProductList.removeWhere(
            (element) => element.productId == _allProduct.productId);
      });
    } else {
      throw Exception('Failed to load Product data.');
    }
  }

  void _fetchJewelleryCatagories() async {
    final res = await http
        .get(Uri.parse(urlEndpointEmu + "api/fetchJewelleryCatagories"));
    if (res.statusCode == 200) {
      setState(() {
        _allProductList = productModelFromJson(res.body);
        _allProductList.removeWhere(
            (element) => element.productId == _allProduct.productId);
      });
    } else {
      throw Exception('Failed to load Product data.');
    }
  }

  void _fetchToysnGamesCatagories() async {
    final res = await http
        .get(Uri.parse(urlEndpointEmu + "api/fetchToysnGamesCatagories"));
    if (res.statusCode == 200) {
      setState(() {
        _allProductList = productModelFromJson(res.body);
        _allProductList.removeWhere(
            (element) => element.productId == _allProduct.productId);
      });
    } else {
      throw Exception('Failed to load Product data.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: Colors.black,
              appBar: appbar(context),
              body: (_allProduct.productName.isEmpty)
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 150),
                      children: [bannerSlider(), listDetail()],
                    ),
              bottomNavigationBar: Container(
                color: Colors.white10,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 4,
                      child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 60,
                          width: 200,
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: () {
                              addProductToCart();

                              Navigator.pop(context);
                            },
                            child: const Text(addToCart),
                          )),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Future<http.Response> addProductToCart() async {
    AddProductTocart addProductTocart = AddProductTocart(
        userId: userId, productId: _allProduct.productId.toString());

    final res = await http.post(
        Uri.parse(urlEndpointEmu + "api/addProductToCart"),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(addProductTocart));

    if (res.statusCode == 200) {
      widget.callback!();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Added")));
    }
    return res;
  }

  AppBar appbar(context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.blue,
      elevation: 0,
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.only(
      //       right: 20.0,
      //     ),
      //     child: GestureDetector(
      //         onTap: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => const Cart()));
      //         },
      //         child: const Center(
      //             child: Icon(
      //           Icons.shopping_cart_outlined,
      //           color: Colors.blue,
      //         ))),
      //   )
      // ],
    );
  }

  Widget bannerSlider() {
    return (_allProduct.item[0].itemImage.isEmpty)
        ? const CircularProgressIndicator()
        : Image.network(_allProduct.item[0].itemImage);
  }

  Widget listDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 290,
                child: Text(
                  _allProduct.productName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  textAlign: TextAlign.start,
                ),
              ),
              Text(
                "\$${_allProduct.item[0].price}",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$stock: ${_allProduct.productAmount}',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue)),
                  textAlign: TextAlign.right,
                ),
                Text(
                  '$sold: ${_allProduct.soldAmount}',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue)),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            _allProduct.item[0].name,
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            textAlign: TextAlign.start,
          ),
          decoration: BoxDecoration(
              color: Colors.white12, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.symmetric(horizontal: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        //BestSell product list view
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            relateProduct,
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15),
          color: Colors.transparent,
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _allProductList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      _allProduct = _allProductList[index];
                    });
                  },
                  child: SizedBox(
                    width: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                _allProductList[index].item[0].itemImage,
                                fit: BoxFit.cover,
                                width: 110,
                                height: 110,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _allProductList[index].productName,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "\$${_allProductList[index].item[0].price}",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    // child: ,
                  ),
                );
              }),
        ),
        //BestSell product list view end

        Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  rating,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  textAlign: TextAlign.center,
                ),
                Text(
                  score,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
        Padding(
            padding: const EdgeInsets.only(left: 18, top: 10, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingBar.builder(
                  unratedColor: Colors.white12,
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) async {
                    Rating raingModel = Rating(userId:userId ,productId:_allProduct.productId ,star: rating.toDouble());
                    final res = await http.post(
                      Uri.parse(urlEndpointEmu + "api/starRating"),
                      headers: <String, String>{
                        'Content-Type': 'application/json'
                      },
                      body: json.encode(raingModel) ,
                    );

                    if(res.statusCode == 200){
                      // ignore: avoid_print
                      print(rating);
                    }
                  },
                ),
                Text(
                  "$_avgStar",
                  
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
      ],
    );
  }
}
