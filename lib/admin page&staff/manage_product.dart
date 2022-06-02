import 'package:flutter/material.dart';
import 'package:gift_delivery_app/admin%20page&staff/add_product.dart';
import 'package:gift_delivery_app/admin%20page&staff/manage_product_detail.dart';
import 'package:gift_delivery_app/language/admin_english.dart';
import 'package:gift_delivery_app/language/english.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageProduct extends StatefulWidget {
  const ManageProduct({Key? key}) : super(key: key);

  @override
  State<ManageProduct> createState() => _ManageProductState();
}

class _ManageProductState extends State<ManageProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appbar(context),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              productSearch,
              const SizedBox(
                height: 10,
              ),
              Expanded(
               

                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    children: [
                      productCard(),
                      productCard(),
                      productCard(),
                   
                    ],
                  ),
                ) 
              
              
              
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(181, 33, 149, 243),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddProduct()));
              },
              child: const Icon(Icons.add),
            ),

    );
  }

  appbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        product,
        style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white)),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      foregroundColor: Colors.blue,
      elevation: 0,
    );
  }

  Widget get productSearch {
    return Center(
      child: SizedBox(
        height: 35,
        width: 300,
        child: Center(
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white54,
                ),
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                fillColor: Colors.white12,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                hintText: homeSearch,
                hintStyle: TextStyle(color: Colors.white54)),
          ),
        ),
      ),
    );
  }

  Widget productCard() {
    const double widgetHeight = 100;
    return InkWell(
      onTap: () {
        Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ManageProductDetail()));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white24),
        height: widgetHeight,
        width: MediaQuery.of(context).size.width - 20,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/giftdad.jpg",
                        height: widgetHeight - 16,
                        width: widgetHeight - 16,
                        fit: BoxFit.cover,
                      )),
                ),
                Column(
                    children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    width: 250,
                    child:  Text(
                           "Apple iPhone 12 Pro Max, 128GB, Pacific Blue - Unlocked (Renewed Premium)",
                           overflow: TextOverflow.ellipsis,
                           maxLines: 2,
                           softWrap: false,
                            style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                         
                          ),
                        ),
                         ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    width: 250,
                    child:  Text(
                           "\$889.00",
                           textDirection: TextDirection.ltr,
                           textAlign: TextAlign.end,
                           overflow: TextOverflow.ellipsis,
                           maxLines: 1,
                           softWrap: false,
                            style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            
                          ),
                        ),
                         ),
                  ),
                    ],
                  ),
    
              ],
            ),
           
          ],
        ),
      ),
    );
  }


}
