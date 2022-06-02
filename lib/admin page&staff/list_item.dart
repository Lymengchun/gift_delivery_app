import 'package:flutter/material.dart';
import 'package:gift_delivery_app/admin%20page&staff/add_item.dart';
import 'package:gift_delivery_app/language/admin_english.dart';
import 'package:google_fonts/google_fonts.dart';

class ListItem extends StatefulWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
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
             
              actions: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      done,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
              centerTitle: true,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.blue,
              elevation: 0,
               title: Text(
                  listItem,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  textAlign: TextAlign.center,
                ),
            ),
            body: Column(children: [
           
      
            ]),
         
          ),
        ],
      ),
       floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(181, 33, 149, 243),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddItem()));
              },
              child: const Icon(Icons.add),
            ),
    );
  }
}