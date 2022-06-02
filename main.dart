import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:self_driving_car_security/Screens/Login-Screen.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'Self Driving Car Security',
    home: LoginScreen(),
  ));
}