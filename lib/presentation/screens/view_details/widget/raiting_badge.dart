
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';

class RatingBadge extends StatelessWidget {
  const RatingBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          Text(
            '4.0',
            style:
                GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}