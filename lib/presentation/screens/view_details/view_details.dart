import 'package:books_app/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewDetails extends StatelessWidget {
  const ViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // final String tag =
    //     ModalRoute.of(context)?.settings.arguments as String? ?? 'tag_0';
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width,
              color: Colors.teal[300],
              child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .3,
                    width: MediaQuery.of(context).size.width * .45,
                    color: kWhite,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.grey[300],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Rich dad poor dad ',
                              style: GoogleFonts.roboto(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .2,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(3)),
                              height: 20,
                              width: 50,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: kOrange,
                                  ),
                                  Text(
                                    '4.0',
                                    style: GoogleFonts.roboto(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Text('by Robert T. Kiyosaki')
                      ],
                    ),
                  ),
                  kHeight10,
                  Text('Published date: April 11, 2017'),
                  Text(
                    "It's been nearly 25 years since Robert Kiyosaki’s Rich Dad Poor Dad first made waves in the Personal Finance arena. It has since become the #1 Personal Finance book of all time... translated into dozens of languages and sold around the world.  Rich Dad Poor Dad is Robert's story of growing up with two dads  his real father and the father of his best friend, his rich dad  and the ways in which both men shaped his thoughts about money and investing. The book explodes the myth that you need to earn a high income to be rich and explains the difference between working for money and having your money work for you.",
                    style: GoogleFonts.roboto(fontSize: 17),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
