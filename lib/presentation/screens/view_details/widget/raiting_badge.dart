
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';

class RatingBadge extends StatelessWidget {
  final dynamic rating;
  const RatingBadge({
    super.key,this.rating
  });

  @override
  Widget build(BuildContext context) {
    print('rating is -> $rating');
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: kGrey600!),
          borderRadius: BorderRadius.circular(3)),
      height: 25,
      width: 50,
      child: Row(
        children: [
          const SizedBox(
            width: 4,
          ),
          const Icon(
            Icons.star,
            size: 14,
            color: kOrange,
          ),
          Text(rating!=null?"$rating:0":'0.0',
            style:
                GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}