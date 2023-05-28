import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/search/widget/title.dart';
import '../../../core/constants/constants.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w250_and_h141_face/6LWy0jvMpmjoS9fojNgHIKoWL05.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleWidget(title: "Top Searches"),
        kHeight,
        Expanded(
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => const TopSearchItemTile(),
              separatorBuilder: (context, index) => kHeight20,
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
            width: screenWidth * 0.35,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
              image: const DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl)),
            )),
        const Expanded(
          child: Text(
            "Movie Name",
            style: TextStyle(
                color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const Icon(
          Icons.play_circle_outline_outlined,
          color: Colors.white,
          size: 60,
        ),
      ],
    );
  }
}
