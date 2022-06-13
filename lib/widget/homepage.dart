import 'package:flutter/material.dart';
import 'package:gift_delivery_app/language/admin_english.dart';
import 'package:gift_delivery_app/language/english.dart';
import 'package:gift_delivery_app/widget/cart.dart';
import 'package:gift_delivery_app/widget/home_product_list.dart';

import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

final catagroiesList = [
  'Cakes',
  'Flowers',
  'Fashion andd Lifestyle Gifts',
  'Jewellery',
  'Toys & Games'
];
String? catagoriesValue;

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      homeScreen(context),
      listScreen(),
      notificationScreen(),
      deliveryScreen()
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appbar(context),
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          IndexedStack(
            index: _selectedIndex,
            children: screens,
          ),
        ],
      ),
      drawer: drawer(),
      bottomNavigationBar: navigationbar(_selectedIndex, _onItemTapped),
    );
  }

  Drawer drawer() {
    return Drawer(
      backgroundColor: Colors.white12,
      child: SafeArea(
          child: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blueAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://giftdeliveryspace.sgp1.digitaloceanspaces.com/cat.jpg'),
                        // backgroundColor: Colors.amber,
                        radius: 40,
                      )),
                  SizedBox(
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Customer name',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.start),
                        const Text('Customer phone',
                            style: TextStyle(
                                color: Colors.white60,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: const [
                            Text('$balance:',
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1),
                            Text(' \$100',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 5,
              height: 5,
              color: Colors.white,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/deposit');
                  },
                  child: Container(
                      decoration: const BoxDecoration(color: Colors.amber),
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.monetization_on,
                              color: Colors.white,
                            ),
                            Text(
                              "  $deposit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/setting');
                  },
                  child: Container(
                      decoration: const BoxDecoration(color: Colors.white10),
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                            Text(
                              "  $setting",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  child: Container(
                      decoration: const BoxDecoration(color: Colors.white10),
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.info,
                              color: Colors.white,
                            ),
                            Text(
                              "  $about",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
            const Spacer(
              flex: 8,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                  decoration: const BoxDecoration(color: Colors.blue),
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        Text(
                          "  $logout",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      )),
    );
  }

  Widget homeScreen(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: homeToptitle(),
        ),
        const SizedBox(
          height: 20,
        ),
      homeSearchBar,
        Expanded(
            child: ListView(
          children: [
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
                children: catagroiesList
                    .map(
                      (item) => InputChip(
                          backgroundColor: Colors.blue,
                          onPressed: () {
                            Navigator.pushNamed(context, '/homeProductList');
                            // if (item == catagroiesList[0]) {
                            // } else if (item == catagroiesList[1]) {
                            // } else if (item == catagroiesList[2]) {
                            // } else if (item == catagroiesList[3]) {
                            // } else {}
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
            //BestSell product list view
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                bestSell,
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
                      onTap: (){
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
            //.........
            //BestSell product list view
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Newest Product',
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
                      onTap: (){
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
            //.........
            //BestSell product list view
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Most rating',
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
                      onTap: (){
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
           ],
        )),
      ],
    );
  }

  Widget listScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 18),
          child: Text(
            "listScreen",
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // homeSearchBar,
        // Container(
        //     height: 50,
        //     width: 800,
        //     color: Colors.transparent,
        //     margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        //     child: tabCategory),
        // Expanded(
        //     child: Container(
        //   margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        //   child: tabCategoryView(context),
        // ))
      ],
    );
  }

  Widget notificationScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 18),
          child: Text(
            "notificationScreen",
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // homeSearchBar,
        // Container(
        //     height: 50,
        //     width: 800,
        //     color: Colors.transparent,
        //     margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        //     child: tabCategory),
        // Expanded(
        //     child: Container(
        //   margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        //   child: tabCategoryView(context),
        // ))
      ],
    );
  }

  Widget deliveryScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 18),
          child: Text(
            "deliveryScreen",
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // homeSearchBar,
        // Container(
        //     height: 50,
        //     width: 800,
        //     color: Colors.transparent,
        //     margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        //     child: tabCategory),
        // Expanded(
        //     child: Container(
        //   margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        //   child: tabCategoryView(context),
        // ))
      ],
    );
  }

  AppBar appbar(context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
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
        ),
      ],
    );
  }

  BottomNavigationBar navigationbar(int _selectedIndex, _onItemTapped) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_outlined),
          label: 'List',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_on_outlined),
          label: 'Notification',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.delivery_dining_outlined),
          label: 'Delivery',
          backgroundColor: Colors.black,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }

  Widget homeToptitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(homeTopTitle1,
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))),
        Text(homeTopTitle2,
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))),
      ],
    );
  }

  Widget get homeSearchBar {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child:  SizedBox(
          height: 35,
          width: 300,
          child: Center(
            child: TextFormField(
              onTap: (){
                Navigator.pushNamed(context, '/homeProductList');
              },
              readOnly: true,
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
}
