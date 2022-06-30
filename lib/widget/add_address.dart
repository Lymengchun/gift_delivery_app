import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gift_delivery_app/globalvar.dart';
import 'package:gift_delivery_app/language/english.dart';
import 'package:gift_delivery_app/model/address_model.dart';
import 'package:gift_delivery_app/model/fetch_address_model.dart';
import 'package:gift_delivery_app/widget/addmore_address.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class AddAdress extends StatefulWidget {
  const AddAdress({Key? key}) : super(key: key);

  @override
  State<AddAdress> createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {
  late AddMoreAddress addMoreAddress;

  late FetchAddressModel fetchAddressModel;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    addMoreAddress = AddMoreAddress(
      callback: callback,
    );
    fetchAllAddress();
  }

  void callback() {
    setState(() {
      fetchAllAddress();
    });
  }

  Future<FetchAddressModel> fetchAllAddress() async {
    final res =
        await http.get(Uri.parse(urlEndpointEmu + "api/getAllAdress/$userId"));
    if (res.statusCode == 200) {
      setState(() {
        isLoading = false;
        fetchAddressModel = fetchAddressModelFromJson(res.body);
      });
    } else {
      throw Exception('Failed to load Product data.');
    }

    return fetchAddressModel;
  }

     void removeAddress(address) async {

      AddressModel addressModel = AddressModel(userId: userId, address: address);

      final res = await http.post(
          Uri.parse(urlEndpointEmu + "api/deleteAddress"),
          headers: <String, String>{
            'Content-Type': 'application/json'
          },
          body: jsonEncode(addressModel));

      if (res.statusCode == 200) {
      
        setState(() {
          fetchAllAddress();
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("removed")));
      }

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
              title: Text(
                addAdress,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: (isLoading)
                  ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.all(0),
                          itemCount: fetchAddressModel.address.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: (){
                                Navigator.pop(context,fetchAddressModel.address[index]);
                              },
                              child: SizedBox(
                                height: 150,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 20),
                                  child: Card(
                                    color: Colors.white12,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Text(
                                                  address,
                                                  style: GoogleFonts.poppins(
                                                      textStyle: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white)),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Text(
                                                  fetchAddressModel
                                                      .address[index],
                                                  style: GoogleFonts.poppins(
                                                      textStyle: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 10),
                                          alignment: Alignment.topCenter,
                                          width: 30,
                                          child: InkWell(
                                            onTap: (){
                                              removeAddress(fetchAddressModel
                                                      .address[index]);
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(181, 33, 149, 243),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddMoreAddress(
                              callback: callback,
                            )));
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
