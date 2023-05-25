import 'package:flutter/material.dart';
import 'package:netflix/presentation/home/widget/number_card.dart';
import '../common_widget/home_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          MainTileCard(title: "Released in the past year"),
          MainTileCard(title: "Trending Now"),
          NumberCardMainList(title: "Top 10 Tv Shows In India Today"),
          MainTileCard(title: "Tense Dramas"),
          MainTileCard(title: "South Indian Cinemas"),
        ],
      ),
    )));
  }
}
