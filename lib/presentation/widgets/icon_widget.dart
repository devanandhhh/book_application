 import 'package:books_app/core/colors.dart';
import 'package:flutter/material.dart';

Container iconContainer() {
    return Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(color: kWhite,borderRadius: BorderRadius.circular(15),border: Border.all(width: .2)),
        child:const Icon(Icons.book,size: 40,color: kOrange,),
      );
  }