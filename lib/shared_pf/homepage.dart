import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharepage/shared_pf/login.dart';
// import 'package:sharepage/shared_pf/shared.dart';
import 'package:sharepage/shared_pf/splashscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Homepage'),
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Hello",
              style: TextStyle(fontSize: 26),
            ),
            MaterialButton(
              color: Colors.lightBlue,
              onPressed: () async {
                final  sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('email');

                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Loginpage(),
                  ),
                );
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  signout(BuildContext context) async {
    final sharpre = await SharedPreferences.getInstance();
    await sharpre.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (cnx1) => const Loginpage()),
        (route) => false);
  }
}
