import 'package:books_app/data/models/book_model.dart';
import 'package:books_app/presentation/screens/view_details/widget/bottom_price_rating.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'widget/book_cover_section.dart';
import 'widget/book_info_session.dart';

class ViewDetails extends StatelessWidget {
  final BookModel bookModel;
  final String? authorName;
  final Color? bgColor;
  const ViewDetails({
    super.key,
    required this.bookModel,
    this.authorName,
    this.bgColor,
  });

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookCoverSection(bgColor: bgColor, bookModel: bookModel),
            BookInfoSection(bookModel: bookModel, authorName: authorName),
          ],
        ),
      ),
      bottomNavigationBar: BottomPriceAndRating(bookModel: bookModel),
    );
  }
}

String formatDate(String inputDate) {
  // Parse the input date string into a DateTime object
  DateTime parsedDate = DateTime.parse(inputDate);

  // Format the DateTime object to the desired format
  DateFormat outputFormat =
      DateFormat('dd-MM-yyyy'); // Target format: 12-02-2020
  return outputFormat.format(parsedDate);
}
