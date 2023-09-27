import 'package:flutter/material.dart';
import 'package:sharepage/anotherlogin/splash.dart';
import 'package:sharepage/shared_pf/splashscreen.dart';




// ignore: constant_identifier_names
const SAVE_KEY ="UserLogIn";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:Splashscreen1(),
    );
  }
}
