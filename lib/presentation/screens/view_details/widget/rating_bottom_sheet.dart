import 'dart:developer';

import 'package:books_app/data/api/books_repo.dart';
import 'package:books_app/data/shared_preference/shared_preference.dart';
import 'package:books_app/presentation/bloc/bloc/rating_option_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';
import '../../../widgets/others.dart';

class AddRatingBottomSheet extends StatefulWidget {
  final String? bookId;
  const AddRatingBottomSheet({
    super.key,this.bookId
  });

  @override
  State<AddRatingBottomSheet> createState() => _AddRatingBottomSheetState();
}

class _AddRatingBottomSheetState extends State<AddRatingBottomSheet> {
  int currentRating = 3;
  String? userToken ;
  @override
  void didChangeDependencies()async {
    super.didChangeDependencies();
   userToken =await TokenService().getToken();
  }
  
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
               setState(() {
                currentRating = rating.floor();  // Update the rating variable
              });
              log('rating:$rating');
            },
          ),
          kHeight10,
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
                onTap: ()async {

                  int? statuscode =
                  await BooksRepoService().addStarRating(widget.bookId!, currentRating, userToken!);
                  if(statuscode==200){
                    print('success');
                    context.read<RatingOptionBloc>().add(RatingSubmitEvent(bookId: widget.bookId!, rating: currentRating, userToken: userToken));
                  }else{
                    print('status code is $statuscode');
                  }
                  Navigator.pop(context);
                  //showSnackBar(context, 'SuccessFully Rated');

                },
                child: submitButton("Submit")),
          )
        ],
      ),
    );
  }
}
