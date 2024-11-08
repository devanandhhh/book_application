import 'package:books_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showSnackBar(BuildContext context, String title, [bool istrue = false]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title,
          style: GoogleFonts.mukta(textStyle: const TextStyle(fontSize: 17))),
      backgroundColor: istrue ? kRed200 : Colors.green[300],
      behavior: SnackBarBehavior.floating,
    ),
  );
}

Container iconContainer() {
  return Container(
    height: 70,
    width: 70,
    decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: .1),
        image: const DecorationImage(image: AssetImage('assets/appIcon.png'))),
    // child:Image.asset('assets/appIcon.png'),
  );
}

Container submitButton(String? text) {
  return Container(
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.orange[800],
    ),
    child: Center(
        child: Text(
      text!,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
    )),
  );
}
