import 'package:firebase_auth/firebase_auth.dart';
import 'package:gift_delivery_app/model/customer_model.dart';
//otp
String userPhone ='';
String verificationID = "";
User? user;
//String urlEndpoint = "http://167.172.78.209:80/";
String urlEndpointEmu = "http://167.172.78.209:80/";
// String urlEndpointEmu = "http://172.19.112.1:80/";
CustomerModel? customerData;
String userId = "";

int cartAmout = 0;
