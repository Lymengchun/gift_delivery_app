import 'package:flutter/material.dart';
import 'package:gift_delivery_app/language/english.dart';
import 'package:gift_delivery_app/widget/addmore_address.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAdress extends StatefulWidget {
  const AddAdress({Key? key}) : super(key: key);

  @override
  State<AddAdress> createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.blue,
              elevation: 0,
            ),
            body: Column(children: [
              const SizedBox(
                height: 70,
              ),
              Center(
                child: Text(
                  addAdress,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    addressList(context),
                    addressList(context),
                    addressList(context),
                    addressList(context),
                    addressList(context),
                    addressList(context),
                    addressList(context),
                  ],
                ),
              ),
              
              
            ]),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(181, 33, 149, 243),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddMoreAddress()));
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

Widget addressList(context) {
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: SizedBox(
            
            child: Card(
              color: Colors.white12,
              child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              address,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Aaron LarsonZippy Diagnostics123 Center Ln.Plymouth, MN 55441+855 XX XXXX XXX',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
     
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
    ),
  );
}
