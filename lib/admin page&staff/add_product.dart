
import 'package:flutter/material.dart';
import 'package:gift_delivery_app/language/admin_english.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
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
                  addProduct,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40,),
              inputAddress(context),
              const SizedBox(height: 40,),
              btSave()
            ]),
         
          ),
        ],
      ),
    );
  }

Widget inputAddress(context){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40),
    child: Column(
      children: [
        TextFormField(
     
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
              
              fillColor: Colors.white12,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: productName,
              hintStyle: TextStyle(
                color: Colors.white54,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
              fillColor: Colors.white12,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: productAmount,
              hintStyle: TextStyle(
                color: Colors.white54,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
              fillColor: Colors.white12,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: catagories,
              hintStyle: TextStyle(
                color: Colors.white54,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          onTap: () {
            Navigator.pushNamed(context, '/addItem');
          },
          readOnly: true,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
              fillColor: Colors.white12,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: item,
               prefixIcon: Icon(
                          Icons.add_circle,
                          color: Colors.white54,
                        ),
              hintStyle: TextStyle(
                color: Colors.white54,
              )),
        ),
      ],
    ),
  );
}

Widget btSave(){
  return SizedBox(
        width: 310,
        height: 60,
        child: ElevatedButton(
            onPressed: () {

            },
            child: Text(
              done,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    
                      )),
              textAlign: TextAlign.center,
              
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            )))),
      );

  }
}