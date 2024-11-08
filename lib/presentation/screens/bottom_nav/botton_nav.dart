import 'package:books_app/presentation/screens/authors_screen/authors_screen.dart';
import 'package:books_app/presentation/screens/bottom_nav/widget.dart';
import 'package:books_app/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationScreen({super.key});

  final List<Widget> pages = [const HomeScreen(), const AuthorsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (context, index, _) => pages[index],
      ),bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
