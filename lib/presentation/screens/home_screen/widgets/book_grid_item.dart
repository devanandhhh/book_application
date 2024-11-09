
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';
import '../../../../data/models/book_model.dart';
import '../../authors_screen/authors_screen.dart';

class BookGridItem extends StatefulWidget {
  const BookGridItem({
    super.key,
    required this.bookData,
    required this.authorData,
  });

  final BookModel bookData;
  final String authorData;

  @override
  State<BookGridItem> createState() => _BookGridItemState();
}

class _BookGridItemState extends State<BookGridItem> {
  @override
  void didChangeDependencies() {
   rating =getFirstRating(widget.bookData.ratings).toString();
    super.didChangeDependencies();

  }
  String rating=0.toString();
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
              child: Image.network(widget.bookData.coverPictureURL),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shortenString(widget.bookData.title, 19),
                  style: GoogleFonts.roboto(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(widget.authorData),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: kOrange,
                      size: 15,
                    ),
                    Text(
                      // getFirstRating(widget.bookData.ratings).toString(),
                      //'4.0',
                      rating,
                      style: GoogleFonts.roboto(
                          fontSize: 17, ),
                    ),
                  ],
                ),
                Text(
                  '₹ ${widget.bookData.price}.00',
                  style: GoogleFonts.roboto(
                      fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
int getFirstRating(List<dynamic> ratings) {
  if (ratings.isNotEmpty) {
    return ratings[0]['rating'] ?? 0;
  }
  return 0; // Return 0 if no ratings are available
}
