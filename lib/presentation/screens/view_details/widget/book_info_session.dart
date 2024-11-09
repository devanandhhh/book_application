import 'package:books_app/presentation/screens/home_screen/widgets/book_grid_item.dart';
import 'package:books_app/presentation/screens/view_details/widget/raiting_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/colors.dart';
import '../../../../data/models/book_model.dart';
import '../../../bloc/bloc/rating_option_bloc.dart';
import '../view_details.dart';

// ignore: must_be_immutable
class BookInfoSection extends StatelessWidget {
  BookInfoSection(
      {super.key,
      required this.bookModel,
      required this.authorName,
      this.rating});

  final BookModel bookModel;
  final String? authorName;
  String? rating;

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
              BookTitleAndRating(
                bookModel: bookModel,
                rating: rating,
              ),
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

// ignore: must_be_immutable
class BookTitleAndRating extends StatefulWidget {
  BookTitleAndRating({super.key, required this.bookModel, this.rating});

  final BookModel bookModel;
  String? rating = '';
  @override
  State<BookTitleAndRating> createState() => _BookTitleAndRatingState();
}

class _BookTitleAndRatingState extends State<BookTitleAndRating> {
  @override
  void didChangeDependencies() {
    rating = getFirstRating(widget.bookModel.ratings).toString();
    super.didChangeDependencies();
  }

  String rating = 0.toString();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            widget.bookModel.title,
            style:
                GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .1,
        ),
        BlocBuilder<RatingOptionBloc, RatingOptionState>(
          builder: (context, state) {
            if (state is RatingLoadingState) {
              return SizedBox(
                  height: 25,
                  width: 50,
                  child: Lottie.network(
                      "https://lottie.host/0973a2ed-d23b-4136-ae5b-c572d8064493/vdNIlz1XvT.json"));
            } else if (state is RatingLoadedState) {
              if (rating == '') {
                rating = getFirstRating(widget.bookModel.ratings).toString();
              }

              if (rating != state.rating.toString()) {
                rating = state.rating.toString();
              }

              return RatingBadge(
                rating: rating, // Show the updated rating
              );
            } else if (state is RatingFaliureState) {
              return kHeight10;
            }
            return RatingBadge(
              rating: rating,
            );
          },
        )
      ],
    );
  }
}
