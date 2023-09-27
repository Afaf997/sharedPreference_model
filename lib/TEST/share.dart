import 'package:flutter/material.dart';

class Secondpage extends StatelessWidget {
  const Secondpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Form(
            child: TextFormField(
              decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person, color: Color.fromARGB(255, 162, 146, 233)),
              hintText: "Last Name",
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 180, 177, 177),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
              border:  OutlineInputBorder(
                 borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              )
            )),
          )
        ],
      ),
    );
  }
}