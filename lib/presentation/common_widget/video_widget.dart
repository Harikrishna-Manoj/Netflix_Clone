import 'package:flutter/material.dart';
import '../../core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl = ("https://www.themoviedb.org/tv/204832");
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          color: kGreyColor,
          width: width,
          height: height * 0.25,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 5,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            radius: 20,
            child: IconButton(
              icon: const Icon(
                Icons.volume_off,
                color: kWhiteColor,
                size: 22,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
