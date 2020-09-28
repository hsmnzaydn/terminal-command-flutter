import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const primaryColor = Color(0xFF282931);
const primaryDarkColor = Color(0xFF171720);
const accnetColor = Color(0xFF0000);

Widget createTextField(String label, Function(String) onChanged) {
  return Container(
      margin: EdgeInsets.all(16),
      child: TextField(
          onChanged: (text) => {onChanged(text)},
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              labelText: label,
              labelStyle: TextStyle(color: Colors.white)),
          cursorColor: Colors.white));
}
