import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/home/widget/home_page_main_buttons.dart';
import 'package:netflix/presentation/new_and_hot/widget/coming_soon.dart';
import 'package:netflix/presentation/new_and_hot/widget/hot_appbar.dart';

import '../../core/constants/constants.dart';

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
  return Center();
}
