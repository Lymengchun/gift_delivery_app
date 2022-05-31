import 'package:flutter/material.dart';
import 'package:gift_delivery_app/language/english.dart';
import 'package:gift_delivery_app/widget/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadProfile extends StatefulWidget {
  const UploadProfile({Key? key}) : super(key: key);

  @override
  State<UploadProfile> createState() => _UploadProfileState();
}

class _UploadProfileState extends State<UploadProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.blue,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0,),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Homepage()));
                },
                child:  const Center(child: Text(btSkip,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 17))
              )),)
        ],
      ),
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
              circleUpload,
              const SizedBox(
                height: 50,
              ),
              btBottom(context)
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
          uploadProfileTitle,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
          textAlign: TextAlign.center,
        ),
        Text(
          uploadProfileDetail,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white38)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    ),
  );
}

Widget get circleUpload {
  return Stack(
    children: [
      Container(
        width: 150,
        height: 150,
        decoration:
            const BoxDecoration(color: Colors.white12, shape: BoxShape.circle),
        child: Center(
            child: InkWell(
          onTap: () {},
          child: const Text(
            uploadProfile,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        )),
      ),
    ],
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
                  MaterialPageRoute(builder: (context) => const Homepage()));
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
