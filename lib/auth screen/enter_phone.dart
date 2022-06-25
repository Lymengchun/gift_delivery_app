import 'package:flutter/material.dart';
import 'package:gift_delivery_app/auth%20screen/verify_phone.dart';
import 'package:gift_delivery_app/language/english.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gift_delivery_app/globalvar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class EnterPhone extends StatefulWidget {
  const EnterPhone({Key? key}) : super(key: key);

  @override
  State<EnterPhone> createState() => _EnterPhoneState();
}

FirebaseAuth auth = FirebaseAuth.instance;

TextEditingController phoneController = TextEditingController();

class _EnterPhoneState extends State<EnterPhone> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
         
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                topTitle,
                inputPhone(phoneController),
                const SizedBox(
                  height: 10,
                ),
                btBottom(context,phoneController)
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
          phoneTitle,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
          textAlign: TextAlign.center,
        ),
        Text(
          phoneDetail,
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

Widget inputPhone(phoneController) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 35),
    child: Row(
      children: [
        Flexible(
          flex: 1,
          child: TextFormField(
            readOnly: true,
            keyboardType: TextInputType.phone,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                fillColor: Colors.white12,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                hintText: "+855",
                hintStyle: TextStyle(color: Colors.white54)),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Flexible(
          flex: 4,
          child: TextFormField(
            // maxLength: 10,
            keyboardType: TextInputType.phone,
            controller: phoneController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                fillColor: Colors.white12,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                hintText: "Phone number",
                hintStyle: TextStyle(color: Colors.white54)),
          ),
        ),
      ],
    ),
  );
}



Widget btBottom(context,phoneController) {
  return Column(
    children: [
      SizedBox(
        width: 320,
        height: 60,
        child: ElevatedButton(
            onPressed: () {
               loginWithPhone();
               userPhone = phoneController.text.toString();
              Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VerifyPhone()));
            },
            child: Text(
              btContinue,
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
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70,),
        child: Text(
            strBelowbt,
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white38)),
            textAlign: TextAlign.center,
          ),
      ),
    ],
  );
}

  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: "+855" + phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationID = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }