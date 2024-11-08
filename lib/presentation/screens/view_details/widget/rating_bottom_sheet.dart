import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';
import '../../../widgets/others.dart';

class AddRatingBottomSheet extends StatelessWidget {
  const AddRatingBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        children: [
          kHeight10,
          Center(
              child: Container(
            height: 4,
            width: 26,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(7)),
          )),
          kHeight20,
          Text(
            'Add rating',
            style: GoogleFonts.inter(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          kHeight10,
          const Divider(),
          kHeight10,
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              log('rating:$rating');
            },
          ),
          kHeight10,
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  showSnackBar(context, 'SuccessFully Rated');
                },
                child: submitButton("Submit")),
          )
        ],
      ),
    );
  }
}
