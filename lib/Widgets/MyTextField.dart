import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String Mytext;
  TextEditingController allcontroller = TextEditingController();
  MyTextField({
    required this.Mytext,
    required this.allcontroller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: allcontroller,
        decoration: InputDecoration(
            hintText: Mytext,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
            )
        ),
      ),
    );
  }
}