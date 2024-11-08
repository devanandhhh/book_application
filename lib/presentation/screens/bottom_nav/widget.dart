import 'package:books_app/core/colors.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (context, index, _) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          selectedItemColor: kOrange,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            selectedIndex.value = index;
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: 'Search'),
          ],
        );
      },
    );
  }
}
