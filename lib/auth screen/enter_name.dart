import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gift_delivery_app/admin%20page&staff/add_product_controller.dart';
import 'package:gift_delivery_app/globalvar.dart';
import 'package:gift_delivery_app/language/english.dart';
import 'package:gift_delivery_app/main.dart';
import 'package:gift_delivery_app/model/user_model.dart';
import 'package:gift_delivery_app/widget/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;


class EnterName extends StatefulWidget {
  const EnterName({Key? key}) : super(key: key);

  @override
  State<EnterName> createState() => _EnterNameState();
}


final ScrollController _controller = ScrollController();

void _scrollDown() {
  _controller.jumpTo(_controller.position.minScrollExtent);
}
class _EnterNameState extends State<EnterName> {
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
  @override
  void initState() {
  
    super.initState();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor:Colors.blue
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          ListView(
            controller: _controller,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  topTitle,
                  inputName,
                  const SizedBox(
                    height: 20,
                  ),
                  btBottom(context),
                  const SizedBox(height: 30,)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }


Widget get topTitle {
  return Center(
    child: Column(
      children: [
        Text(
          inputNameTitle,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
          textAlign: TextAlign.center,
        ),
        Text(
          inputNameDetail,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white38)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    ),
  );
}

Widget get inputName {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40),
    child: Column(
      children: [
        TextFormField(
          onTap: () {
            _scrollDown();
          },
          style: const TextStyle(color: Colors.white),
          controller: firstNameController,
          decoration: const InputDecoration(
              
              fillColor: Colors.white12,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: inputFirstname,
              hintStyle: TextStyle(
                color: Colors.white54,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: lastNameController,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
              fillColor: Colors.white12,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: inputLastName,
              hintStyle: TextStyle(
                color: Colors.white54,
              )),
        ),
      ],
    ),
  );
}

Future<void> initUser()async{
    UserModel userModel = UserModel(phone: userPhone, name: '${firstNameController.text}${lastNameController.text}');
    await http.post(
    Uri.parse(urlEndpointEmu + "api/initCustomer"),
    headers: <String, String>{'Content-Type': 'application/json'},
    body: jsonEncode(userModel),
  ).then((value) =>{
    getUserData(),
    Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyApp()))});
}

Widget btBottom(context) {
  return Column(
    children: [
      const SizedBox(
        height: 10,
      ),
      SizedBox(
        width: 310,
        height: 60,
        child: ElevatedButton(
            onPressed: () {
              initUser();
            },
            child: Text(
              btinputContinue,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
              textAlign: TextAlign.center,
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            )))),
      ),
    ],
  );
}
}