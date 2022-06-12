import 'package:flutter/material.dart';
import 'package:gift_delivery_app/admin%20page&staff/AdminModel/product_model.dart';
import 'package:gift_delivery_app/language/admin_english.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ManageProductDetail extends StatefulWidget {
  final ProductModel allProduct;

  const ManageProductDetail({Key? key, required this.allProduct})
      : super(key: key);

  @override
  State<ManageProductDetail> createState() => _ManageProductDetailState();
}

class _ManageProductDetailState extends State<ManageProductDetail> {
  late ProductModel allProduct;
  @override
  void initState() {
    super.initState();
    allProduct = widget.allProduct;
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

  AppBar appbar(context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.blue,
      elevation: 0,
      actions: const [
        Padding(
          padding: EdgeInsets.only(
            right: 20.0,
          ),
        )
      ],
    );
  }

  Widget bannerSlider(context) {
    return Container(
      // height: 250,
      width: MediaQuery.of(context).size.width,
      color: Colors.white24,
      child: Image.network(
        allProduct.item[0].itemImage,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget listDetail() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width:  300,
                      child: Text(
                        allProduct.productName,
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                        softWrap: true,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      '\$${allProduct.item[0].price}',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
              width: MediaQuery.of(context).size.width,
              child: const Divider(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width:  350,
                    child: Text(
                      allProduct.item[0].name,
                      overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          softWrap: true,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.,
                              color: Colors.white)),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    '$productAmount:',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${allProduct.productAmount}',
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
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    '$soldAmount:',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${allProduct.soldAmount}',
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
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    '$uploadeDate:',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    DateFormat.yMMMEd().format(allProduct.postDate as DateTime),
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
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    '$catagories:',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    allProduct.catagories,
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
          ],
        ),
      ],
    );
  }
}
