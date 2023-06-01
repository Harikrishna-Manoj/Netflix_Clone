import 'package:flutter/material.dart';
import 'package:netflix/presentation/new_and_hot/widget/coming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widget/everyone_watching_widget.dart';
import 'package:netflix/presentation/new_and_hot/widget/hot_appbar.dart';

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
  return const Padding(
    padding: EdgeInsets.only(top: 10),
    child: ComingSoonWidget(),
  );
}

buildEveryoneIsWatching(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.only(right: 5.0, left: 5, top: 10),
    child: EveryoneWatching(),
  );
}
