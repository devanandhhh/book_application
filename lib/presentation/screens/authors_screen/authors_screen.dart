import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(
          'Authors',
          style: GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text("Robert T. Kiyosaki"),
              subtitle: Text(
                  shortenString(dummytext, 95),style: GoogleFonts.aBeeZee(fontSize: 12),),
              leading: CircleAvatar(child: Icon(Icons.person)),
              //trailing: Icon(Icons.arrow_forward),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
String dummytext = "Robert Toru Kiyosaki is an American businessman and author, known for the Rich Dad Poor Dad series of personal finance books";
String shortenString(String input, int range) {
  if (input.length > range) {
    return '${input.substring(0, range)}...';
  } else {
    return input;
  }
}