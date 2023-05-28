import 'package:flutter/material.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/new_and_hot/widget/coming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widget/everyone_watching_widget.dart';
import 'package:netflix/presentation/new_and_hot/widget/hot_appbar.dart';
import 'package:netflix/presentation/common_widget/video_widget.dart';

import '../../core/colors/colors.dart';
import '../home/widget/home_page_main_buttons.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const HotPageAppbar(),
              Expanded(
                child: SizedBox(
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Flexible(
                        child: TabBarView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildComingSoon(),
                            buildEveryoneIsWatching(context)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

_buildComingSoon() {
  return ListView.builder(
    itemBuilder: (context, index) {
      return const Padding(
        padding: EdgeInsets.only(top: 10),
        child: ComingSoonWidget(),
      );
    },
    physics: const BouncingScrollPhysics(),
    itemCount: 10,
  );
}

buildEveryoneIsWatching(BuildContext context) {
  return Padding(
      padding: const EdgeInsets.only(right: 5.0, left: 5, top: 10),
      child: ListView.builder(
        itemBuilder: (context, index) => const EveryoneWatching(),
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
      ));
}
