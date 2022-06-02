import 'package:flutter/material.dart';
import 'package:gift_delivery_app/language/english.dart';
import 'package:gift_delivery_app/widget/cart.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageProductDetail extends StatefulWidget {
  const ManageProductDetail({Key? key}) : super(key: key);

  @override
  State<ManageProductDetail> createState() => _ManageProductDetailState();
}

class _ManageProductDetailState extends State<ManageProductDetail> {
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
              body: Column(
                children: [
                  bannerSlider(context),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(child: listDetail())
                ],
              ))
        ],
      ),
    );
  }
  
  AppBar appbar(context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.blue,
    elevation: 0,
    actions: [
      Padding(
        padding: const EdgeInsets.only(
          right: 20.0,
        ),
        child: GestureDetector(
            onTap: () {
               Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Cart()));
            },
            child: const Center(
                child: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.blue,
            ))),
      )
    ],
  );
}

Widget bannerSlider(context) {
  return Container(
    height: 250,
    width: MediaQuery.of(context).size.width,
    color: Colors.white24,
  );
}

Widget listDetail() {
  return ListView(
    scrollDirection: Axis.horizontal,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  productName,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  price,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      )
    ],
  );
}
}