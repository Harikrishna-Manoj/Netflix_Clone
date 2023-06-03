import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import 'home_page_main_buttons.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: size * 0.75,
          decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CoustomTextButton(icon: Icons.add, label: "My List"),
                _homePagePlayButton(),
                const CoustomTextButton(
                    icon: Icons.info_outline, label: "info"),
              ],
            ),
          ),
        )
      ],
    );
  }
}

TextButton _homePagePlayButton() {
  return TextButton.icon(
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhiteColor)),
    onPressed: () {},
    icon: const Icon(
      Icons.play_arrow,
      color: Colors.black,
      size: 30,
    ),
    label: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        "Play",
        style: TextStyle(
            fontSize: 18, color: kBlackColor, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
