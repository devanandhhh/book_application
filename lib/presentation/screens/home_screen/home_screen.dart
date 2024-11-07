import 'package:books_app/core/colors.dart';
import 'package:books_app/presentation/screens/view_details/view_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('App name',
            style:
                GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            const CupertinoSearchTextField(),
            kHeight10,
            Flexible(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                    childAspectRatio: .62),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ViewDetails(),
                          ));
                    },
                    child: Container(
                      color: Colors.teal,
                      height: 400,
                      width: 100,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, top: 10, bottom: 10),
                            child: Container(
                              color: kGrey600,
                              height: MediaQuery.of(context).size.height * 0.24,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rich dad poor dad',
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text('Author name'),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: kOrange,
                                      size: 20,
                                    ),
                                    Text(
                                      '4.0',
                                    ),
                                  ],
                                ),
                                Text(
                                  '₹ 456.00',
                                  style: GoogleFonts.roboto(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
