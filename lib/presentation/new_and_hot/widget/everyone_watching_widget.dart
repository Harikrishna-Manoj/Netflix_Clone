import 'package:flutter/material.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../common_widget/video_widget.dart';
import '../../home/widget/home_page_main_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EveryoneWatching extends StatelessWidget {
  const EveryoneWatching({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryOneWatching());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text("Error while loading coming soon list"),
          );
        } else if (state.everyOneIsWatchingList.isEmpty) {
          return const Center(
            child: Text("Coming soon list is empty"),
          );
        } else {
          return ListView.builder(
              physics:const  BouncingScrollPhysics(),
              itemCount: state.everyOneIsWatchingList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.everyOneIsWatchingList[index].title ??
                          state.everyOneIsWatchingList[index].name ??
                          'no title',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    kHeight,
                    Text(
                      state.everyOneIsWatchingList[index].overview!,
                      style: const TextStyle(color: kGreyColor),
                    ),
                    kHeight50,
                    Stack(
                      children: [
                        Container(
                          color: kGreyColor,
                          width: width,
                          height: height * 0.25,
                          child: Image.network(
                            state.everyOneIsWatchingList[index].backdropPath !=
                                    null
                                ? '$imageAppendUrl${state.everyOneIsWatchingList[index].backdropPath}'
                                : "https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg",
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
                    ),
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
              });
        }
      },
    );
  }
}
