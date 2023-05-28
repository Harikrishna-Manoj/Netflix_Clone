import 'package:flutter/material.dart';
import 'package:netflix/presentation/downloads/screen_downloads.dart';
import 'package:netflix/presentation/fast_lauughs/screen_fast_laughs.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/main_page/widget/bottom_nav.dart';
import 'package:netflix/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final _pages = [
    ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
    ScreenDownload()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifer,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
