import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';
import '../../common_widget/mian_title.dart';

const imageUrl = "https://www.themoviedb.org/tv/1622-supernatural";

class NumberOverlapCard extends StatelessWidget {
  const NumberOverlapCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Container(
            width: size * 0.35,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(imageUrl))),
          ),
        ),
        Positioned(
          top: 70,
          left: 15,
          child: BorderedText(
            strokeWidth: 1.5,
            strokeColor: Colors.white,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                  fontSize: 100,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class NumberCardMainList extends StatelessWidget {
  const NumberCardMainList({super.key, required this.title});
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
              children: List.generate(
                  20,
                  (index) => NumberOverlapCard(
                        index: index,
                      )),
            ),
          )
        ],
      ),
    );
  }
}
