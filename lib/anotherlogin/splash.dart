import 'dart:async';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharepage/anotherlogin/home.dart';
import 'package:sharepage/anotherlogin/login.dart';


String? finalEmail;

class Splashscreen1 extends StatefulWidget {
  Splashscreen1({super.key});

  @override
  State<Splashscreen1> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen1> {
  Future checkData() async {
    final sharedPreferences =
        await SharedPreferences.getInstance();
    var optainedEmail = sharedPreferences.getString('email');

    setState(() {
      finalEmail = optainedEmail;
    });
    print(finalEmail);
  }

  @override
  void initState() {
    checkData().whenComplete(() async {
      Timer(const Duration(seconds: 2), () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            if (finalEmail == null) {
              return const Loginpage1();
            } else {
              return const HomePage1();
            }
          },
        ));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              child: Icon(Icons.local_activity),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}