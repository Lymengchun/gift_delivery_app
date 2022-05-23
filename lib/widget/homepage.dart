import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/language/english.dart';
import 'package:flutter_application_1/widget/product_detail.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

late TabController _tabController;

final tabs = [
  'Tab 1',
  'Tab 2',
  'Tab 3',
  'Tab 4',
  'Tab 5',
  'Tab 6',
  'Tab 7',
  'Tab 8',
  'Tab 9',
];

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: List',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: Notification',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 3: Delivery',
  //     style: optionStyle,
  //   ),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appbar,
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          Column(
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
              Container(
                  height: 50,
                  width: 800,
                  color: Colors.transparent,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: tabCategory),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: tabCategoryView(context),
              ))
            ],
          ),
        ],
      ),
      drawer: drawer,
      bottomNavigationBar: navigationbar(_selectedIndex, _onItemTapped),
    );
  }
}

AppBar get appbar {
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
            onTap: () {},
            child: const Center(
                child: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.blue,
            ))),
      )
    ],
  );
}

Drawer get drawer {
  return const Drawer(
    backgroundColor: Colors.white12,
    child: SafeArea(
        child: Text(
      "Hello",
      style: TextStyle(color: Colors.white),
    )),
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

TabBar get tabCategory {
  return TabBar(
      controller: _tabController,
      indicatorColor: Colors.blue,
      isScrollable: true,
      tabs: [
        for (final tab in tabs) Tab(text: tab),
      ]);
}

TabBarView tabCategoryView(context) {
  return TabBarView(
    controller: _tabController,
    children: [
       
      for (final tab in tabs)
        InkWell(
          onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductDetail()));
          },
          child: Text(
            tab,
            style: const TextStyle(color: Colors.white),
          ),
        ),
    ],
  );
}
