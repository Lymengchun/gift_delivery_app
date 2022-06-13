import 'package:flutter/material.dart';
import 'package:gift_delivery_app/language/admin_english.dart';
import 'package:gift_delivery_app/language/english.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final languageList = ['Khmer', 'English'];
    String? languageValue;
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
              body: ListView(
                children: [
                  Container(
                    // decoration: const BoxDecoration(color: Colors.),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          const Text(
                            language,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(width: 200,),
                          DropdownButton(
                            hint: Text(languageList[1],style: const TextStyle(color: Colors.white),),
                            dropdownColor: Colors.black,
                            value: languageValue,
                            items: languageList.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(() {
                              languageValue = value.toString();
                            }),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  appbar(BuildContext context) {
    return AppBar(
      title: const Text(
        setting,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.blue,
      elevation: 0,
    );
  }

  DropdownMenuItem<String> buildMenuItem(String languageItem) =>
      DropdownMenuItem(
        value: languageItem,
        child: Text(
          languageItem,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
}
