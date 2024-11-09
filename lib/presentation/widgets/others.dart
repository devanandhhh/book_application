import 'package:books_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

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

Center lottieSearch() {
  return Center(
    child: Lottie.network(
        'https://lottie.host/7355749b-f541-495e-89ec-b892ddd9fcdb/eTedSRfErD.json'),
  );
}
// dialog_utils.dart

Future<void> showNetworkErrorDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        'Network Error',
        style: GoogleFonts.roboto(
            fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),
      ),
      content: const Text(
          'No internet connection. Please check your network and try again.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

