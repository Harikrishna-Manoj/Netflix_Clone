import 'package:flutter/material.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/search/widget/title.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w250_and_h141_face/6LWy0jvMpmjoS9fojNgHIKoWL05.jpg";

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleWidget(title: "Movies & TV"),
        kHeight,
        Expanded(
            child: GridView.count(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 3,
          childAspectRatio: 1 / 1.4,
          children: List.generate(20, (index) {
            return const MainCard();
          }),
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5),
          image: const DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imageUrl))),
    );
  }
}
