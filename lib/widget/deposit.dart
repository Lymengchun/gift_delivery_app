import 'package:flutter/material.dart';
import 'package:gift_delivery_app/language/english.dart';

class Deposit extends StatefulWidget {
  const Deposit({Key? key}) : super(key: key);

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
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
              body: const Center(
                child: Text(" ©RUPP - ITE - CHHUNLYMENG - 2022",style: TextStyle(color: Colors.white38),),
              )),
        ],
      ),
    );
  }

appbar(context){
    return AppBar(
      title: const Text(
        deposit,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.blue,
      elevation: 0,
    );
  }
  }
