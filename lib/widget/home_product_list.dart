

import 'package:flutter/material.dart';
import 'package:gift_delivery_app/language/admin_english.dart';
import 'package:gift_delivery_app/language/english.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeProductList extends StatefulWidget {
  const HomeProductList({Key? key}) : super(key: key);

  @override
  State<HomeProductList> createState() => _HomeProductListState();
}

class _HomeProductListState extends State<HomeProductList> {

  final _catagroiesList = [
  'Cakes',
  'Flowers',
  'Fashion andd Lifestyle Gifts',
  'Jewellery',
  'Toys & Games'
];


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
              body:SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _homeSearchBar,
                    //Catagories chip
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                catagories,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              // color: Colors.amber,
              child: Wrap(
                spacing: 5.0,
                runSpacing: 5.0,
                children: _catagroiesList
                    .map(
                      (item) => InputChip(
                          backgroundColor: Colors.blue,
                          onPressed: () {
                            if (item == _catagroiesList[0]) {
                            } else if (item == _catagroiesList[1]) {
                            } else if (item == _catagroiesList[2]) {
                            } else if (item == _catagroiesList[3]) {
                            } else {}
                          },
                          label: Text(
                            item,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    )
                    .toList(),
              ),
            ),
            //Catagories chip end
                  ],
                ),
              )
              ),
        ],
      ),
    );
  }

    Widget get _homeSearchBar {
    return  Padding(
      padding: const EdgeInsets.only(left: 18),
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

  appbar(context){
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.blue,
      elevation: 0,
    );
}
}