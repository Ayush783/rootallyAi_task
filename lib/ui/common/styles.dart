import 'package:flutter/material.dart';

InputDecoration inputDecoration(String hint) => InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 3,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 3,
        ),
      ),
      hintText: hint,
      hintStyle: TextStyle(fontFamily: 'poppins'),
      contentPadding: EdgeInsets.all(24),
    );

ButtonStyle buttonStyle = OutlinedButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50),
  ),
  side: BorderSide(color: Colors.black, width: 3),
  textStyle: TextStyle(
      fontFamily: 'poppins', fontSize: 16, fontWeight: FontWeight.bold),
  primary: Colors.black,
  padding: EdgeInsets.symmetric(vertical: 16),
);

ButtonStyle buttonStyle2 = TextButton.styleFrom(
  textStyle: TextStyle(
      fontFamily: 'poppins', fontSize: 16, fontWeight: FontWeight.bold),
  primary: Colors.black,
  padding: EdgeInsets.symmetric(vertical: 16),
);

const TextStyle textStyle1 = TextStyle(fontFamily: 'poppins', fontSize: 16);
const TextStyle textStyle2 = TextStyle(fontSize: 24, fontFamily: 'poppins');
