import 'package:flutter/material.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';

class HotPageAppbar extends StatelessWidget {
  const HotPageAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          kWidth,
          const Text(
            "New & Hot",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
          ),
          const Spacer(),
          const Icon(
            Icons.cast,
            color: Colors.white,
            size: 28,
          ),
          kWidth,
          Container(
            width: 28,
            height: 28,
            color: Colors.blue,
          ),
          kWidth,
        ],
      ),
      kHeight,
      SizedBox(
        height: 40,
        child: TabBar(
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50), // Creates border
                color: kWhiteColor),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: kBlackColor,
            unselectedLabelColor: kWhiteColor,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            labelPadding: const EdgeInsets.symmetric(horizontal: 8),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
            tabs: const [
              Tab(
                text: "🍿 Coming Soon",
              ),
              Tab(
                text: "👀 Everyone's Watching",
              )
            ]),
      ),
    ]);
  }
}
