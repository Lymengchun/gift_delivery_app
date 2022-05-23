import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth%20screen/enter_phone.dart';
import 'package:google_fonts/google_fonts.dart';
import '../language/english.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/startbg.png"),
            fit: BoxFit.cover,
          )),
        ),
        Container(
          decoration: const BoxDecoration(color: Colors.black54),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(giftLove,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w500,
                          color: Colors.white))),
              Padding(
                padding: const EdgeInsets.only(left: 55, right: 55),
                child: Text(
                  detailTxt,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EnterPhone()));
                  },
                  child: Text(
                    btGetStarted,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    textAlign: TextAlign.center,
                  ),
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(300, 60),
                       
                      )               
                      ),
   
              const SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
