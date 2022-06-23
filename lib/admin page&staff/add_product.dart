import 'package:flutter/material.dart';
import 'package:gift_delivery_app/admin%20page&staff/add_item.dart';
import 'package:gift_delivery_app/admin%20page&staff/add_product_controller.dart';
import 'package:gift_delivery_app/language/admin_english.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProduct extends StatefulWidget {
  final Function? callback;

  const AddProduct({
    Key? key,
    this.callback,
  }) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  late AddItem addItem;
  TextEditingController itemName = TextEditingController();
  bool emptyItem = true;

  final catagroiesList = [
    'Cakes',
    'Flowers',
    'Fashion andd Lifestyle Gifts',
    'Jewellery',
    'Toys & Games'
  ];
  String? catagoriesValue;
  @override
  void initState() {
    super.initState();
    addItem = AddItem(
      callback: callback,
    );
  }

  void callback() {
    setState(() {
      itemName = itemNameController;
      emptyItem = false;
    });

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
              centerTitle: true,
              title: Text(
                addProduct,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                textAlign: TextAlign.center,
              ),
            ),
            body: ListView(
              children: [
                Column(children: [
                  const SizedBox(
                    height: 40,
                  ),
                  inputAddProduct(context),
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

  Widget inputAddProduct(context) {
    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            TextFormField(
              controller: productNameController,
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
              keyboardType: TextInputType.number,
              controller: productAmountController,
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
            Container(
              height: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white12),
              child: DropdownButton(
                  hint: const Text(
                    catagories,
                    style: TextStyle(color: Colors.white54, fontSize: 17),
                  ),
                  menuMaxHeight: 200,
                  isExpanded: true,
                  style: const TextStyle(color: Colors.black),
                  dropdownColor: Colors.black,
                  value: catagoriesValue,
                  items: catagroiesList.map(buildMenuItem).toList(),
                  onChanged: (value) => setState(() {
                        catagoriesValue = value.toString();
                        productCatagoriesController.text = catagoriesValue!;
                      })),
            ),
            
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onTap: () {
                //  Navigator.pushNamed(context, '/addItem');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddItem(
                              callback: callback,
                            )));
              },
              readOnly: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  fillColor: Colors.white12,
                  filled: true,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: (itemName.text.isEmpty) ? item : itemName.text,
                  prefixIcon: const Icon(
                    Icons.add_circle,
                    color: Colors.white54,
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.white54,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String catagoriesItem) =>
      DropdownMenuItem(
        value: catagoriesItem,
        child: Text(
          catagoriesItem,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      );

  clearProductController() {
    productNameController.clear();
    productAmountController.clear();
    productCatagoriesController.clear();
    // productItemController.clear();
  }

  Widget btSave() {
    return InkWell(
      onTap: () {
        if (!_formKey.currentState!.validate()) {
          return;
        }
        if (catagoriesValue == null) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text("Catagories not yet seleted!")));
          return;
        }
        if (emptyItem) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text("Item not yet added!")));
          return;
        }

        // ScaffoldMessenger.of(context)
        //     .showSnackBar(const SnackBar(content: Text("Added")));
        postSingleProduct();
        widget.callback!();

        Navigator.pop(context);
        clearProductController();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blue),
        width: 310,
        height: 60,
        child: Center(
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
        ),
      ),
    );
  }
}
