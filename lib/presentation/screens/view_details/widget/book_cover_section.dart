import 'package:flutter/widgets.dart';

import '../../../../core/colors.dart';
import '../../../../data/models/book_model.dart';

class BookCoverSection extends StatelessWidget {
  const BookCoverSection({
    super.key,
    required this.bgColor,
    required this.bookModel,
  });

  final Color? bgColor;
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      width: MediaQuery.of(context).size.width,
      color: bgColor ?? kgreen100,
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * .3,
          width: MediaQuery.of(context).size.width * .40,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  bookModel.coverPictureURL,
                ),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
