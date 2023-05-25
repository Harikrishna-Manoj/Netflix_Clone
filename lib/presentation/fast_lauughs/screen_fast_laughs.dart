import 'package:flutter/material.dart';
import 'package:netflix/presentation/fast_lauughs/widget/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: List.generate(
              20,
              (index) => VideoItemWidget(
                    index: index,
                  )),
        ),
      ),
    );
  }
}
