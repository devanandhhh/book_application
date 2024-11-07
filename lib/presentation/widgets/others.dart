import 'package:books_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showSnackBar(BuildContext context, String title, [bool istrue = false]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title,
          style: GoogleFonts.mukta(textStyle: const TextStyle(fontSize: 17))),
      backgroundColor: istrue ? kRed200 : kGreen200,
      behavior: SnackBarBehavior.floating,
    ),
  );
}
