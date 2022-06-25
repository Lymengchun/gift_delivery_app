import 'package:flutter/material.dart';
import 'package:gift_delivery_app/admin%20page&staff/AdminModel/product_model.dart';
import 'package:gift_delivery_app/globalvar.dart';
import 'package:gift_delivery_app/language/admin_english.dart';
import 'package:gift_delivery_app/language/english.dart';
import 'package:gift_delivery_app/widget/product_detail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomeProductList extends StatefulWidget {
  final int? chipIndex;
  final Function? callback;
  const HomeProductList({Key? key, this.chipIndex,this.callback}) : super(key: key);

  @override
  State<HomeProductList> createState() => _HomeProductListState();
}

class _HomeProductListState extends State<HomeProductList> {
  final _catagroiesList = [
    'Cakes',
    'Flowers',
    'Fashion and Lifestyle Gifts',
    'Jewellery',
    'Toys & Games',
    'All'
  ];
  Color chipSelected = Colors.amber;
  int? selectedIndex;
  List<ProductModel> _allProduct = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getProduct();
    selectedIndex = widget.chipIndex;
    if (selectedIndex == 5) {
      //  selectedIndex = widget.chipIndex;
      _getAllProduct();
    } else if (selectedIndex == 4) {
      _fetchToysnGamesCatagories();
    } else if (selectedIndex == 3) {
      _fetchJewelleryCatagories();
    } else if (selectedIndex == 2) {
      _fetchFashionandLifestyleGiftsCatagories();
    } else if (selectedIndex == 1) {
      _fetchFlowersCatagories();
    } else {
      _fetchCakesCatagories();
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
              body: SafeArea(
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
                      padding: const EdgeInsets.only(left: 20),
                      child: Wrap(
                        spacing: 5.0,
                        children: _catagroiesList
                            .map(
                              (item) => createChoiceChip(
                                  _catagroiesList.indexOf(item),
                                  item,
                                  chipSelected),
                            )
                            .toList(),
                      ),
                    ),
                    //Catagories chip end

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GridView.builder(
                            itemCount: _allProduct.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductDetail(
                                              allProduct: _allProduct[index],callback: widget.callback,)));
                                },
                                child: SizedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              _allProduct[index]
                                                  .item[0]
                                                  .itemImage,
                                              fit: BoxFit.cover,
                                              width: 140,
                                              height: 140,
                                            )),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _allProduct[index].productName,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              '\$${_allProduct[index].item[0].price.toDouble()}',
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
                            })),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  void _getAllProduct() async {
    final res = await http.get(Uri.parse(urlEndpointEmu + "api/getAllProduct"));
    if (res.statusCode == 200) {
      setState(() {
        _allProduct = productModelFromJson(res.body);
      });
      
    } else {
      throw Exception('Failed to load Product data.');
    }
  }


  void _fetchCakesCatagories() async {
    final res = await http.get(Uri.parse(urlEndpointEmu + "api/fetchCakesCatagories"));
    if (res.statusCode == 200) {
      setState(() {
        _allProduct = productModelFromJson(res.body);
      });
    } else {
      throw Exception('Failed to load Product data.');
    }
  }
    void _fetchFlowersCatagories() async {
    final res = await http.get(Uri.parse(urlEndpointEmu + "api/fetchFlowersCatagories"));
    if (res.statusCode == 200) {
      setState(() {
        _allProduct = productModelFromJson(res.body);
      });
    } else {
      throw Exception('Failed to load Product data.');
    }
  }

     void _fetchFashionandLifestyleGiftsCatagories() async {
    final res = await http.get(Uri.parse(urlEndpointEmu + "api/fetchFashionandLifestyleGiftsCatagories"));
    if (res.statusCode == 200) {
      setState(() {
        _allProduct = productModelFromJson(res.body);
      });
    } else {
      throw Exception('Failed to load Product data.');
    }
  }

      void _fetchJewelleryCatagories() async {
    final res = await http.get(Uri.parse(urlEndpointEmu + "api/fetchJewelleryCatagories"));
    if (res.statusCode == 200) {
      setState(() {
        _allProduct = productModelFromJson(res.body);
      });
    } else {
      throw Exception('Failed to load Product data.');
    }
  }

        void _fetchToysnGamesCatagories() async {
    final res = await http.get(Uri.parse(urlEndpointEmu + "api/fetchToysnGamesCatagories"));
    if (res.statusCode == 200) {
      setState(() {
        _allProduct = productModelFromJson(res.body);
      });
    } else {
      throw Exception('Failed to load Product data.');
    }
  }



  Widget createChoiceChip(int index, String label, Color color) {
    return InputChip(
        selected: selectedIndex == index,
        onSelected: (bool selected) {
          setState(() {
            selectedIndex = (selected ? index : null)!;
          });

          if (selectedIndex == 5) {
            _getAllProduct();
          } else if (selectedIndex == 4) {
            setState(() {
              _fetchToysnGamesCatagories();
            });
          } else if (selectedIndex == 3) {
            setState(() {
              _fetchJewelleryCatagories();
            });
          } else if (selectedIndex == 2) {
            setState(() {
              _fetchFashionandLifestyleGiftsCatagories();
            });
          } else if (selectedIndex == 1) {
            setState(() {
              _fetchFlowersCatagories();
            });
          } else {
            setState(() {
              _fetchCakesCatagories();
            });
          }
        },
        selectedColor: color,
        backgroundColor: Colors.blue,
        label: Text(
          label,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }

  Widget get _homeSearchBar {
    return Padding(
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

  appbar(context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.blue,
      elevation: 0,
    );
  }
}
