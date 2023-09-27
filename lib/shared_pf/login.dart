import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharepage/main.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharepage/shared_pf/homepage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();

  // bool _isDataMatched =true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Login page'),
      ),
      body: Container(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Email',
                      contentPadding: EdgeInsets.all(10.0),
                      hintStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                        return "Enter Correct Email Address";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Password',
                        contentPadding: EdgeInsets.all(10.0),
                        hintStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password.';
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 characters long.';
                        } else if (!value.contains(RegExp(r'[A-Z]')) ||
                            !value.contains(RegExp(r'[0-9]')) ||
                            !value.contains(RegExp(r'[#@!~]'))) {
                          return 'Password must contain at least one Capital letter, one number, and one special character.';
                        }
                        return null;
                      }),
                ),
                MaterialButton(
                  color: Colors.redAccent,
                  child: const Text('Login'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  // void checklogin(BuildContext ctx)async{
  //   final emailtype =emailController.text;
  //   final passtype =passwordController.text;
  //   if(emailtype == passtype){
  //     final sharpre =await SharedPreferences.getInstance();
  //    await sharpre.setBool(SAVE_KEY, true);
  //   }else{

  //   }
  // }
}
