import 'package:flutter/material.dart';

const imageUrl = "https://www.themoviedb.org/tv/1622-supernatural";

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: size * 0.35,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
            image: const DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(imageUrl))),
      ),
    );
  }
}
