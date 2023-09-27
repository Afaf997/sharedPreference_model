// ignore_for_file: use_build_context_synchronously

import 'dart:async';
// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharepage/main.dart';
import 'package:sharepage/shared_pf/homepage.dart';
import 'package:sharepage/shared_pf/login.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

String? finalEmail;

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    checkUserLoggedIn();
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
              radius: 40.0,
              child: Icon(Icons.local_activity),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Loginpage()));
  }

  Future<void> checkUserLoggedIn() async {
    final sharpre = await SharedPreferences.getInstance();
    final userLogged = sharpre.getBool(SAVE_KEY);
    if (userLogged == null || userLogged == false) {
      gotoLogin();
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx1) => const HomePage()));
    }
  }
}
