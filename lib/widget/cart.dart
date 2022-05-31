
import 'package:flutter/material.dart';
import 'package:gift_delivery_app/language/english.dart';
import 'package:gift_delivery_app/widget/add_address.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

final controller = GroupButtonController();

class _CartState extends State<Cart> {
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
            body: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Text(
                  cartTitle,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(child: listDetail(context)),
              ],
            ),
            bottomNavigationBar: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              color: Colors.white12,
              child: Row(
                children: [
                  Flexible(
                    flex: 4,
                    child: Row(
                      children: [
                        Radio(
                            value: null,
                            groupValue: null,
                            onChanged: (Null? value) {}),
                        Text(
                          selectAll,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2, 
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.black38,
                            child: Center(
                              child: Text(
                                edit,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(width: 5,),
                          Flexible(
                            flex: 7,
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white30,
                              child: Center(
                                child: Text(
                                  submission,
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                          ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.blue,
      elevation: 0,
    );
  }

  listDetail(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cartList(context),
              cartList(context),
              cartList(context),

              // Row(
              //   children: [
              //     Text(
              //       productName,
              //       style: GoogleFonts.poppins(
              //           textStyle: const TextStyle(
              //               fontSize: 14,
              //               fontWeight: FontWeight.w500,
              //               color: Colors.white)),
              //       textAlign: TextAlign.center,
              //     ),
              //     const SizedBox(
              //       width: 30,
              //     ),
              //     Text(
              //       price,
              //       style: GoogleFonts.poppins(
              //           textStyle: const TextStyle(
              //               fontSize: 20,
              //               fontWeight: FontWeight.w500,
              //               color: Colors.white)),
              //       textAlign: TextAlign.center,
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                width: 310,
                child:TextFormField(
                    readOnly: true,
                    onTap: () {
                        Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddAdress()));
                    },
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.pin_drop,
                          color: Colors.white54,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        fillColor: Colors.white12,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        hintText: deliveryTo,
                        hintStyle: TextStyle(
                          color: Colors.white54,
                        )),
                  ),
          
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                deliveryOn,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                width: 310,
                child: TextFormField(
                  onTap: () {},
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      fillColor: Colors.white12,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      hintText: "16/12/2022",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
              SizedBox(height: 300, width: 300, child: deliveryTimePicker)
            ],
          ),
        )
      ],
    );
  }

  cartList(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          // color: Colors.white12,
          height: 100,
          width: MediaQuery.of(context).size.width - 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    color: Colors.white12,
                    height: 90,
                    width: 100,
                    child: Image.asset(
                      "assets/giftdad.jpg",
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Fixed Time Deliver​y 50\$vcddddsadfasdfasdasdfasdfasdfsdgsdfgssdfgsdfgsdfgsdf",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 14, color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width - 50,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120),
              child: Text(
                "5\$",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ]),
        ),
        Checkbox(
            value: true,
            onChanged: (bool? value) {
              setState(() {});
            })
      ],
    );
  }
}

Widget get deliveryTimePicker {
  int _value = 1;
  return Column(
    children: [
      ListTile(
        title: const Text(
          "Stadart Delivery5\$",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Radio(
          groupValue: null,
          onChanged: (Null? value) {},
          value: null,
        ),
      ),
      ListTile(
        title: const Text(
          "Free Delivery free",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Radio(
          groupValue: null,
          onChanged: (Null? value) {},
          value: null,
        ),
      ),
      ListTile(
        title: const Text(
          "Fixed Time Deliver​y 50\$",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Radio(
          groupValue: null,
          onChanged: (Null? value) {},
          value: null,
        ),
      ),
      ListTile(
        title: const Text(
          "Mid Night Delivery 100\$",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Radio(
          groupValue: null,
          onChanged: (Null? value) {},
          value: null,
        ),
      )
    ],
  );
}
