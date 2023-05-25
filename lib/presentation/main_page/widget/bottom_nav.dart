import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

ValueNotifier<int> indexChangeNotifer = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifer,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: backgroundColor,
              currentIndex: newIndex,
              onTap: (index) {
                indexChangeNotifer.value = index;
              },
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedIconTheme: const IconThemeData(color: Colors.white),
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.collections_outlined),
                  label: 'New & Hot',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions_outlined),
                  label: 'Fast Laughs',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_circle_down_outlined),
                  label: 'Downloads',
                ),
              ]);
        });
  }
}
