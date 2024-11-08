
import 'package:books_app/presentation/screens/view_details/widget/add_rating_button.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../data/models/book_model.dart';

class BottomPriceAndRating extends StatelessWidget {
  const BottomPriceAndRating({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .09,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '₹ ${bookModel.price}.00',
              style:
                  GoogleFonts.inter(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const AddRatingButton()
          ],
        ),
      ),
    );
  }
}
