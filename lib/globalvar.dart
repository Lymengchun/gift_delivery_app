import 'package:firebase_auth/firebase_auth.dart';
import 'package:gift_delivery_app/model/customer_model.dart';
//otp
String userPhone = '0960000001';
String verificationID = "";
User? user;
String urlEndpoint = "http://localhost:80/";
String urlEndpointEmu = 'http://192.168.8.101:80/';
CustomerModel? customerData;
