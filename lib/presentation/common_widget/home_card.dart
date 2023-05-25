import 'package:flutter/material.dart';
import 'package:netflix/presentation/common_widget/mian_title.dart';
import '../../core/constants/constants.dart';
import '../home/card_view.dart';

class MainTileCard extends StatelessWidget {
  const MainTileCard({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: title),
          kHeight,
          LimitedBox(
            maxHeight: size * 0.50,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: List.generate(20, (index) => const CardView()),
            ),
          )
        ],
      ),
    );
  }
}
