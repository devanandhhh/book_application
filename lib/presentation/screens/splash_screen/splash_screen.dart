import 'package:books_app/presentation/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.orange[700],
      body: Center(
        child: iconContainer(),
      ),
    );
  }

 
}
 