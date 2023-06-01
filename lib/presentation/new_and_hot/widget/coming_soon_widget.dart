import 'package:flutter/material.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:text_scroll/text_scroll.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../home/widget/home_page_main_buttons.dart';
import '../../common_widget/video_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.hasError) {
          return const Center(
            child: Text("Error while loading coming soon list"),
          );
        } else if (state.comingSoonList.isEmpty) {
          return const Center(
            child: Text("Coming soon list is empty"),
          );
        } else {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.comingSoonList.length,
              itemBuilder: (BuildContext context, index) {
                final date = DateTime.parse(
                    state.comingSoonList[index].releaseDate ?? "2002-05-01");
                final formatedDate = DateFormat.yMMMMd("en_us").format(date);
                final month =
                    formatedDate.split(' ').first.substring(0, 3).toUpperCase();
                return Row(
                  children: [
                    SizedBox(
                      width: 50,
                      height: height * 0.55,
                      child: Column(
                        children: [
                          Text(
                            month,
                            style: const TextStyle(
                                color: kGreyColor, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            state.comingSoonList[index].releaseDate!
                                .split('-')[2],
                            style: const TextStyle(
                                fontSize: 30,
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
                          VideoWidget(
                              vieoImageUrl:
                                  '$imageAppendUrl${state.comingSoonList[index].backdropPath!}'),
                          SizedBox(
                            width: width - 50,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width - 180,
                                  child: TextScroll(
                                    mode: TextScrollMode.endless,
                                    velocity: const Velocity(
                                        pixelsPerSecond: Offset(30, 0)),
                                    state.comingSoonList[index].originalTitle!,
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Spacer(),
                                const Row(
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
                            'Coming on ${state.comingSoonList[index].releaseDate!.split('-')[2]} $month',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400),
                          ),
                          kHeight,
                          Text(
                            state.comingSoonList[index].originalTitle!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          kHeight,
                          SizedBox(
                            width: width - 50,
                            height: height * 0.15,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Text(
                                    state.comingSoonList[index].overview!,
                                    style: const TextStyle(color: kGreyColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              });
        }
      },
    );
  }
}
