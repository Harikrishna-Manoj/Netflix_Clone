import 'package:flutter/material.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../home/widget/home_page_main_buttons.dart';
import 'hot_page_stack.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: height * 0.55,
          child: const Column(
            children: [
              Text(
                "FEB",
                style:
                    TextStyle(color: kGreyColor, fontWeight: FontWeight.bold),
              ),
              Text(
                "11",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5),
              ),
              kHeight
            ],
          ),
        ),
        SizedBox(
          height: height * 0.55,
          width: width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              hotPageStackImage(context),
              SizedBox(
                width: width - 50,
                child: const Row(
                  children: [
                    Text(
                      "Tall Girl",
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        CoustomTextButton(
                          icon: Icons.notifications,
                          label: "Remaind me",
                          iconSize: 20,
                          textSize: 10,
                          textColor: kGreyColor,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        CoustomTextButton(
                          icon: Icons.info_outline,
                          label: "info",
                          iconSize: 20,
                          textSize: 10,
                          textColor: kGreyColor,
                        ),
                        kWidth
                      ],
                    )
                  ],
                ),
              ),
              Text(
                'Coming on Friday',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey.shade400),
              ),
              kHeight,
              const Text(
                "Tall Girl",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kHeight,
              const Text(
                "Landing the lead in the school musical is a dream come true for Jodi,until the pressure sends her confidenc - and her relationship - into a tailspin",
                style: TextStyle(color: kGreyColor),
              ),
            ],
          ),
        )
      ],
    );
  }
}
