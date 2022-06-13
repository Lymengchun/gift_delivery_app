import 'package:flutter/material.dart';
import 'package:gift_delivery_app/admin%20page&staff/list_item.dart';
import 'package:gift_delivery_app/admin%20page&staff/manage_home.dart';
import 'package:gift_delivery_app/admin%20page&staff/manage_product.dart';
import 'package:gift_delivery_app/globalvar.dart';
import 'package:gift_delivery_app/widget/about.dart';
import 'package:gift_delivery_app/widget/deposit.dart';
import 'package:gift_delivery_app/widget/home_product_list.dart';
import 'package:gift_delivery_app/widget/homepage.dart';
import 'package:gift_delivery_app/widget/product_detail.dart';
import 'package:gift_delivery_app/widget/setting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';


// import 'auth screen/enter_phone.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gift Delevery',
      theme: ThemeData(
     
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme
        ),
        primarySwatch: Colors.blue,
      ),
      // home: const Myapp(),
      initialRoute: '/',
      routes: {
        '/':(context) => const AppRouteManage(),

        '/productDetail':(context) => const ProductDetail(),
        '/homepage':(context) => const Homepage(),
        '/manageProduct':(context) => const ManageProduct(),
        '/addItem':(context) => const ListItem(),
        '/setting':((context) => const Setting()),
        '/about':(context) => const About(),
        '/deposit':(context) => const Deposit(),
        '/homeProductList':(context) => const HomeProductList()
      },
    );
  }
}


// class Myapp extends StatefulWidget {
//   const Myapp({ Key? key }) : super(key: key);

//   @override
//   State<Myapp> createState() => _MyappState();
// }

// class _MyappState extends State<Myapp> {
//   @override
//   Widget build(BuildContext context) {
//     return (userPhone == "")? const StartScreen():const Homepage();
//   }
// }


class AppRouteManage extends StatelessWidget {
  const AppRouteManage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (userPhone == "0964037982")? const ManageHome():const Homepage();
  }
}


