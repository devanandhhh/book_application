import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/colors.dart';

class Skelton extends StatelessWidget {
  const Skelton({super.key, required this.height, required this.width});
  final double height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.04),
            borderRadius: BorderRadius.circular(16)));
  }
}

class BookGridItemShimmer extends StatelessWidget {
  const BookGridItemShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhite,
      height: 400,
      width: 100,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skelton(
                height: MediaQuery.of(context).size.height * 0.24,
                width: MediaQuery.of(context).size.width),
            kHeight10,
            const Skelton(height: 20, width: 80),
            kHeight10,
            const Skelton(height: 20, width: 80)
          ],
        ),
      ),
    );
  }
}

Widget buildAuthorCardShimmer() {
  return Container(
    height: 75,
    width: double.infinity,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(9), color: kWhite),
    child: const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Skelton(height: 50, width: 50),
          kWidth10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight20,
              Skelton(height: 15, width: 250),
              kHeight10,
              Skelton(height: 15, width: 200)
            ],
          )
        ],
      ),
    ),
  );
}

Center lottieRegister() {
  return Center(
    child: Lottie.network(
        "https://lottie.host/2b676ea0-2d8b-4afb-b109-885f691e6223/Tp9aHa7CVU.json",
        height: 150,
        width: 150,
        fit: BoxFit.contain),
  );
}
