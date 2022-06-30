

import 'package:flutter/material.dart';
import 'package:gift_delivery_app/admin%20page&staff/add_product_controller.dart';
import 'package:gift_delivery_app/admin%20page&staff/list_item.dart';
import 'package:gift_delivery_app/admin%20page&staff/manage_home.dart';
import 'package:gift_delivery_app/admin%20page&staff/manage_product.dart';
import 'package:gift_delivery_app/auth%20screen/enter_phone.dart';
import 'package:gift_delivery_app/globalvar.dart';
import 'package:gift_delivery_app/start_screen.dart';
import 'package:gift_delivery_app/widget/about.dart';
import 'package:gift_delivery_app/widget/deposit.dart';
import 'package:gift_delivery_app/widget/homepage.dart';
import 'package:gift_delivery_app/widget/product_detail.dart';
import 'package:gift_delivery_app/widget/setting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';



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
      debugShowCheckedModeBanner: false,
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
        '/':(context) => const CheckOldPhone(),

        '/productDetail':(context) => const ProductDetail(),
        '/appRouteManage':(context) => const AppRouteManage(),
        '/homepage':(context) => const Homepage(),
        '/manageProduct':(context) => const ManageProduct(),
        '/addItem':(context) => const ListItem(),
        '/setting':((context) => const Setting()),
        '/about':(context) => const About(),
        '/deposit':(context) => const Deposit(),
        '/enterPhone':(context) => const EnterPhone(),
        // '/homeProductList':(context) => const HomeProductList()
      },
    );
  }
}

class CheckOldPhone extends StatefulWidget {
  const CheckOldPhone({Key? key}) : super(key: key);

  @override
  State<CheckOldPhone> createState() => _CheckOldPhoneState();
}

class _CheckOldPhoneState extends State<CheckOldPhone> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
       getPhoneNumber();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

    getPhoneNumber()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('user_phone') != null){
      userPhone = prefs.getString('user_phone')!;
    }
    print(prefs.getString('user_phone'));
    Navigator.pushNamed(context, '/appRouteManage');
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

    super.initState();
    // getUserData();
  }




  @override
  Widget build(BuildContext context) {
    return (userPhone.isEmpty)?(StartScreen()):FutureBuilder(future: getUserData(), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
        return (customerData?.type == 'customer')?const Homepage():(userPhone == '0964037982')?const ManageHome():const Center(child: CircularProgressIndicator());
        // ?:const ManageHome();
     },);

    
    // (userPhone == "0964037982")? const ManageHome():const Homepage();
  }

}


