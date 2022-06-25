import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gift_delivery_app/admin%20page&staff/manage_home.dart';
import 'package:gift_delivery_app/auth%20screen/enter_name.dart';
import 'package:gift_delivery_app/globalvar.dart';
import 'package:gift_delivery_app/language/english.dart';
import 'package:gift_delivery_app/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VerifyPhone extends StatefulWidget {
  const VerifyPhone({Key? key}) : super(key: key);

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

final TextEditingController _optOne = TextEditingController();
final TextEditingController _optTwo = TextEditingController();
final TextEditingController _optThree = TextEditingController();
final TextEditingController _optFour = TextEditingController();
final TextEditingController _optFive = TextEditingController();
final TextEditingController _optSix = TextEditingController();


class _VerifyPhoneState extends State<VerifyPhone> {
  String pinOpt = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  bool ishas = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findPhone();
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text((pinOpt == "")?userPhone:pinOpt,style:const TextStyle(color: Colors.white),),
              const SizedBox(
                height: 100,
              ),
              topTitle,
              inputCode(),
              const SizedBox(
                height: 20,
              ),
              btBottom(context)
            ],
          ),
        ],
      ),
    );

    
  }

Widget inputCode() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40),
    child: Row(
      children: [
   
        optInput( _optOne, first:true,last: false),
        const SizedBox(
          width: 5,
        ),

        optInput( _optTwo, first:false,last: false),
        const SizedBox(
          width: 5,
        ),

        optInput( _optThree, first:false,last: false),
        const SizedBox(
          width: 5,
        ),
      
        optInput( _optFour, first:false,last: false),
        const SizedBox(
          width: 5,
        ),
    
        optInput( _optFive, first:false,last: false),
        const SizedBox(
          width: 5,
        ),
        
        optInput( _optSix, first:false,last: true),
        
      ],
    ),
  );
}
optInput(TextEditingController controller,{required bool first, last}){
    return Flexible(
          flex: 1,
          child: TextFormField(
    
            controller: controller,
            onChanged: (value) {
              if(value.length == 1 && last == false){
                FocusScope.of(context).nextFocus();
              }
              if(value.isEmpty && first == false){
                FocusScope.of(context).previousFocus();
              }
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
                fillColor: Colors.white12,
                filled: true,
                border: OutlineInputBorder(
                    // borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                // hintText: "5",
                hintStyle: TextStyle(
                  color: Colors.white,
                )),
          ),
        );
  
}

Widget btBottom(context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            strAlert,
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            child: Text(
              btRequestCode,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue)),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      SizedBox(
        width: 310,
        height: 60,
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                pinOpt = _optOne.text+
                         _optTwo.text+
                         _optThree.text+
                         _optFour.text+
                         _optFive.text+
                         _optSix.text ;
              });
              verifyOTP();
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const Homepage()));
            },
            child: Text(
              btVerify,
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
    void findPhone() async {
    final res = await http.get(Uri.parse(urlEndpointEmu + "api/findUser/$userPhone"));
    if (res.statusCode == 200) {
      if(json.decode(res.body)['phone'] != null){
        setState(() {
          ishas = true;
        });
      }else{
        ishas = false;
      }
    } else {
      throw Exception('Failed to load Product data.');
    }
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: pinOpt);

    await auth.signInWithCredential(credential).then(
      (value) {
        setState(() {
          user = FirebaseAuth.instance.currentUser;
        });
      },
    ).whenComplete(
      () async {
        if (user != null) {
          Fluttertoast.showToast(
            msg: "You are logged in successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('user_phone',userPhone);
          // Navigator.pushNamed(context, '/homepage');
          Navigator.push(context, MaterialPageRoute(builder: (context)=>(userPhone == '0964037982')?ManageHome():(ishas)?MyApp():EnterName()));
        } else {
          Fluttertoast.showToast(
            msg: "your login is failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
    );

}

Widget get topTitle {
  return Center(
    child: Column(
      children: [
        Text(
          verifyTitle,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
          textAlign: TextAlign.center,
        ),
        Text(
          verifyDetail,
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

}
