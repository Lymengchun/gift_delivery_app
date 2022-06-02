import 'package:flutter/material.dart';
import 'package:gift_delivery_app/language/admin_english.dart';
import 'package:google_fonts/google_fonts.dart';


class ManageHome extends StatefulWidget {
  const ManageHome({Key? key}) : super(key: key);

  @override
  State<ManageHome> createState() => _ManageHomeState();
}

const double btSpace = 25;

class _ManageHomeState extends State<ManageHome> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appbar(context),
      body: Stack(
        children: [
         
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                    welcome+" Lymeng",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    textAlign: TextAlign.start,
                  ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    
                   const SizedBox(height: 5,),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                print("Hi dashboard");
                              },
                              child: btAdmin(dashboard,"2",Icons.dashboard_outlined)),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/manageProduct');
                              },
                              child: btAdmin(product,"",Icons.warehouse_outlined)),
                          ],
                        ),
                        const SizedBox(
                          height: btSpace,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            btAdmin(customers,"9",Icons.person_outline),
                            btAdmin(orders,"5",Icons.shopping_bag_outlined),
                          ],
                        ),
                        const SizedBox(
                          height: btSpace,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            btAdmin(staff,"",Icons.work_outline_outlined),
                            btAdmin(checkDeposit,"2",Icons.monetization_on_outlined),
                          ],
                        ),
                        const SizedBox(
                          height: btSpace,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/homepage');
                              },
                              child: btAdmin(shop,"",Icons.storefront_outlined)),
                            
                          ],
                        ),
                        
                      
                      ],
                    )
                  ],
                )
                
                ),
            ],
          )

        ],
      ),
      drawer: drawer,
  
    );
  }

  Widget btAdmin(String btName,String amountNotification,IconData btIcon){
    return Stack(
        children: [
          Padding(
           padding: const EdgeInsets.fromLTRB(120, 15, 0, 0),
           child:(amountNotification == "")? Container():CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 12,
                child: Text(amountNotification,style: const TextStyle(color: Colors.white),),
            ),
         ),
          Container(
            
            width: 160,
            height: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white24),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(btIcon,color: Colors.white,),
                  Text(btName,style: const TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ),
        ],
    );
  }
  
  appbar(BuildContext context) {
    return AppBar(
    centerTitle: true,
    title: Text(
                  home,
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
    elevation: 0,

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
}

