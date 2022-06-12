import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gift_delivery_app/admin%20page&staff/AdminModel/product_model.dart';
import 'package:gift_delivery_app/admin%20page&staff/add_product_controller.dart';
import 'package:gift_delivery_app/globalvar.dart';
import 'package:gift_delivery_app/language/admin_english.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:permission_handler/permission_handler.dart';

class AddItem extends StatefulWidget {
  final Function ?callback;
  const AddItem({Key? key, this.callback}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formKey = GlobalKey<FormState>();

  File imageFile = File('');
  bool imgUploaded = false;
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  @override
  void initState() {
    super.initState();

    () async {
      var _permissionStatus = await Permission.storage.status;

      if (_permissionStatus != PermissionStatus.granted) {
        PermissionStatus permissionStatus = await Permission.storage.request();
        setState(() {
          _permissionStatus = permissionStatus;
        });
      }
    }();
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
            body: ListView(
              children: [
                Column(children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Center(
                    child: Text(
                      item,
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
              ],
            ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: itemNameController,
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
              validator: (value) {
                if (value!.isNotEmpty) {
                  return null;
                } else {
                  return "please fill some text.";
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: itemPriceController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  fillColor: Colors.white12,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: price,
                  hintStyle: TextStyle(
                    color: Colors.white54,
                  )),
              validator: (value) {
                if (value!.isNotEmpty) {
                  return null;
                } else {
                  return "please fill some text.";
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // TextFormField(
            //   controller: itemImageController,
            //   onTap: () async {
            //     final ImagePicker _picker = ImagePicker();
            //     final XFile? image =
            //         await _picker.pickImage(source: ImageSource.gallery);
            //     // print(image!.path);

            //     File imageFile = File(image!.path.toString());

            //     print(imageFile.path);
            //   },
            //   readOnly: true,
            //   style: const TextStyle(color: Colors.white),
            //   decoration: const InputDecoration(
            //       fillColor: Colors.white12,
            //       filled: true,
            //       border: OutlineInputBorder(
            //           borderSide: BorderSide.none,
            //           borderRadius: BorderRadius.all(Radius.circular(15))),
            //       hintText: addImage,
            //       prefixIcon: Icon(
            //         Icons.add_a_photo,
            //         color: Colors.white54,
            //       ),
            //       hintStyle: TextStyle(
            //         color: Colors.white54,
            //       )),
            // ),

            InkWell(
                onTap: () async {
                  try {
                    image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      imageFile = File(image!.path);
                      imgUploaded = true;
                    });
                    print(image!.path);
                  } catch (e) {
                    print("print error$e");
                  }
                  // setState(() {
                  //   imgUploaded = true;
                  // });
                  // print(image!.path);
                },
                child: (imgUploaded)
                    ? Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(imageFile),
                                fit: BoxFit.cover)),
                      )
                    : Container(
                        height: 160,
                        width: 160,
                        color: Colors.white12,
                        child: const Icon(
                          Icons.add_a_photo,
                          color: Colors.white24,
                        ),
                      ))
          ],
        ),
      ),
    );
  }

  Future<String> fileUpload(File imageFile) async {
    var postUri = Uri.parse("${urlEndpointEmu}upload");
    var request = http.MultipartRequest("POST", postUri);
    try {
      request.files.add(http.MultipartFile.fromBytes(
          'upload', await File.fromUri(imageFile.uri).readAsBytes(),
          filename: imageFile.path.split('/').last,
          contentType: MediaType('JPEG', 'jpg')));
          itemImageController.text = 'https://giftdeliveryspace.sgp1.digitaloceanspaces.com/${imageFile.path.split('/').last}';
      print(request);
      request.send().then((response) {
        if (response.statusCode == 200) {
          print("Uploaded!");
         
            
        } else {
          print(response.headers);
        }
      });
    } catch (error) {
      print(error);
    }

    Item itemModel = Item(
        price:int.parse(itemPriceController.text),
        itemImage: itemImageController.text,
        name: itemNameController.text);
    listItemsController.add(itemModel);
    
    Navigator.pop(context,itemNameController);
      clearItemController();
    return itemImageController.text;
  }

  clearItemController() {
    itemNameController.clear();
    itemPriceController.clear();
    itemImageController.clear();
  }

  Widget btSave() {
    return SizedBox(
      width: 310,
      height: 60,
      child: ElevatedButton(
          onPressed: () async {
            if (!_formKey.currentState!.validate()) {
              return;
            }
            if(imageFile.path.isEmpty){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.redAccent,content: Text("image not yet upload!")));
              return;
            }
             fileUpload(imageFile);
            widget.callback!();
           
          },
          child: Text(
            item,
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
