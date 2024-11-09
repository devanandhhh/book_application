import 'package:books_app/presentation/screens/view_details/widget/rating_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';

class AddRatingButton extends StatelessWidget {
  final String? bookId;
  const AddRatingButton({
    super.key,  this.bookId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return  AddRatingBottomSheet(bookId:bookId,);
          },
        );
      },
      child: Container(
        height: 35,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.orange[800], borderRadius: BorderRadius.circular(6)),
        child: Center(
          child: Text(
            'Add rating',
            style: GoogleFonts.aBeeZee(
                fontSize: 16, fontWeight: FontWeight.bold, color: kWhite),
          ),
        ),
      ),
    );
  }
}
