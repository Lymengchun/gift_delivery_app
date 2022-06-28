import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gift_delivery_app/globalvar.dart';
import 'package:gift_delivery_app/language/english.dart';
import 'package:gift_delivery_app/model/address_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class AddMoreAddress extends StatefulWidget {
  final Function? callback;
  const AddMoreAddress({Key? key,this.callback}) : super(key: key);

  @override
  State<AddMoreAddress> createState() => _AddMoreAddressState();
}

class _AddMoreAddressState extends State<AddMoreAddress> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


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
              const SizedBox(
                height: 40,
              ),
              inputAddress(context),
              const SizedBox(
                height: 40,
              ),
              btSave()
            ]),
          ),
        ],
      ),
    );
  }

  Widget inputAddress(context) {
    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isNotEmpty) {
                  return null;
                } else {
                  return "please fill some text.";
                }
              },
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  fillColor: Colors.white12,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: name,
                  hintStyle: TextStyle(
                    color: Colors.white54,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isNotEmpty) {
                  return null;
                } else {
                  return "please fill some text.";
                }
              },
              controller: _addressController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  fillColor: Colors.white12,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: address,
                  hintStyle: TextStyle(
                    color: Colors.white54,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isNotEmpty) {
                  return null;
                } else {
                  return "please fill some text.";
                }
              },
              controller: _phoneController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  fillColor: Colors.white12,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: phone,
                  hintStyle: TextStyle(
                    color: Colors.white54,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future<http.Response> addMoreAddress() async {
    String _all_address =
        '${_nameController.text}/${_addressController.text}/${_phoneController.text}';
    AddressModel addressModel = AddressModel(userId: userId, address: _all_address);
    final res = await http.post(
      Uri.parse(urlEndpointEmu + "api/addAddress"),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: json.encode(addressModel),
    );
    if(res.statusCode == 200){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text("address added!")));
    }
    return res;
  }

  Widget btSave() {
    return SizedBox(
      width: 310,
      height: 60,
      child: ElevatedButton(
          onPressed: () {
            if (!_formKey.currentState!.validate()) {
              return;
            }

            addMoreAddress();
            Navigator.pop(context);
            widget.callback!();
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
    );
  }
}
