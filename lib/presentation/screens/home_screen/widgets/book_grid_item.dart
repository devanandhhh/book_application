
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';
import '../../../../data/models/book_model.dart';
import '../../authors_screen/authors_screen.dart';

class BookGridItem extends StatelessWidget {
  const BookGridItem({
    super.key,
    required this.bookData,
    required this.authorData,
  });

  final BookModel bookData;
  final String authorData;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhite,
      
      height: 400,
      width: 100,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 24, right: 24, top: 10, bottom: 10),
            child: SizedBox(
              
              height: MediaQuery.of(context).size.height * 0.24,
              width: MediaQuery.of(context).size.width,
              child: Image.network(bookData.coverPictureURL),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shortenString(bookData.title, 19),
                  style: GoogleFonts.roboto(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(authorData),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: kOrange,
                      size: 20,
                    ),
                    Text(
                      '4.0',
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  '₹ ${bookData.price}.00',
                  style: GoogleFonts.roboto(
                      fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
