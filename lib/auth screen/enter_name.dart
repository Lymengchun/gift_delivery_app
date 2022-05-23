import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth%20screen/upload_profile.dart';
import 'package:flutter_application_1/language/english.dart';
import 'package:google_fonts/google_fonts.dart';

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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UploadProfile()));
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
