import 'package:flutter/material.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../common_widget/video_widget.dart';
import '../../home/widget/home_page_main_buttons.dart';

class EveryoneWatching extends StatelessWidget {
  const EveryoneWatching({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Friends",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          "This hit sitcom follow the merry misadvantures of six 20-something pals as they navigate the pitfalls of work, life and love in 1990s Manhattan",
          style: TextStyle(color: kGreyColor),
        ),
        kHeight50,
        const VideoWidget(),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CoustomTextButton(
              icon: Icons.send_outlined,
              label: "Share",
              iconSize: 30,
              textSize: 13,
              textColor: Colors.grey.shade700,
            ),
            kWidth,
            CoustomTextButton(
              icon: Icons.add,
              label: "My List",
              iconSize: 30,
              textSize: 13,
              textColor: Colors.grey.shade700,
            ),
            kWidth,
            CoustomTextButton(
              icon: Icons.play_arrow,
              label: "Play",
              iconSize: 30,
              textSize: 13,
              textColor: Colors.grey.shade700,
            ),
            kWidth
          ],
        )
      ],
    );
  }
}
