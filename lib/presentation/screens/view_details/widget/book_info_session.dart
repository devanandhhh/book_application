
import 'package:books_app/presentation/screens/view_details/widget/raiting_badge.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';
import '../../../../data/models/book_model.dart';
import '../view_details.dart';

class BookInfoSection extends StatelessWidget {
  const BookInfoSection({
    super.key,
    required this.bookModel,
    required this.authorName,
  });

  final BookModel bookModel;
  final String? authorName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookTitleAndRating(bookModel: bookModel),
              Text(
                "by ${authorName ?? 'Unknown'}",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
              )
            ],
          ),
          kHeight10,
          Text(
            "Publish Date: ${formatDate(bookModel.publishedDate.toString())}",
            style: GoogleFonts.poppins(fontSize: 13, color: kGrey600),
          ),
          kHeight10,
          Text(
            bookModel.description,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class BookTitleAndRating extends StatelessWidget {
  const BookTitleAndRating({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            bookModel.title,
            style:
                GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .1,
        ),
        const RatingBadge()
      ],
    );
  }
}

