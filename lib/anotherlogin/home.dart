import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharepage/anotherlogin/login.dart';
// import 'package:sharepage/shared_pf/login.dart';
// import 'package:sharepage/shared_pf/splashscreen.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePageState();
}
String? finalEmail;
class _HomePageState extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const Text('Homepage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello $finalEmail",
              style:const TextStyle(fontSize: 26),
            ),
            MaterialButton(
              color: Colors.lightBlue,
              onPressed: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('email');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  Loginpage1(),
                  ),
                );
              },
              child:const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}