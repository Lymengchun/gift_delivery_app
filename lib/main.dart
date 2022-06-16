
import 'package:flutter/material.dart';
import 'package:gift_delivery_app/admin%20page&staff/add_product_controller.dart';
import 'package:gift_delivery_app/admin%20page&staff/list_item.dart';
import 'package:gift_delivery_app/admin%20page&staff/manage_home.dart';
import 'package:gift_delivery_app/admin%20page&staff/manage_product.dart';
import 'package:gift_delivery_app/globalvar.dart';
import 'package:gift_delivery_app/widget/about.dart';
import 'package:gift_delivery_app/widget/deposit.dart';
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
        // '/homeProductList':(context) => const HomeProductList()
      },
    );
  }
}





class AppRouteManage extends StatefulWidget {
  const AppRouteManage({Key? key}) : super(key: key);

  @override
  State<AppRouteManage> createState() => _AppRouteManageState();
}

  

class _AppRouteManageState extends State<AppRouteManage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getUserData();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: getUserData(), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
        return (customerData?.type == 'customer')?const Homepage():(userPhone == '0964037982')?const ManageHome():const Center(child: CircularProgressIndicator());
        // ?:const ManageHome();
     },);

    
    // (userPhone == "0964037982")? const ManageHome():const Homepage();
  }

}


