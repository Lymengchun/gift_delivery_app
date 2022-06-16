import 'package:flutter/material.dart';
import 'package:gift_delivery_app/admin%20page&staff/AdminModel/product_model.dart';
import 'package:gift_delivery_app/language/english.dart';
import 'package:gift_delivery_app/widget/cart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetail extends StatefulWidget {
  final ProductModel? allProduct;
 
  const ProductDetail({Key? key, this.allProduct,}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late ProductModel _allProduct;

  @override
  void initState() {
    super.initState();
    _allProduct = widget.allProduct!;
    print(_allProduct);
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
                            onPressed: () {},
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
          margin: EdgeInsets.symmetric(horizontal: 20),
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
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/productDetail');
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
                                'https://giftdeliveryspace.sgp1.digitaloceanspaces.com/cat.jpg',
                                fit: BoxFit.cover,
                                width: 110,
                                height: 110,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'ProductName',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '\$10',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
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
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                Text(
                  '5.0',
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
