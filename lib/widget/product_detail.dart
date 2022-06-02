import 'package:flutter/material.dart';
import 'package:gift_delivery_app/language/english.dart';
import 'package:gift_delivery_app/widget/cart.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {


  @override
  void initState() {
    super.initState();
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
              textAlign: TextAlign.center,
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
        ),
      )
    ],
  );
}

Widget get deliveryTimePicker {
  int _value = 1;
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
