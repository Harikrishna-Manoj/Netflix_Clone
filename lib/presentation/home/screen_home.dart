// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/application/home_page/home_page_bloc.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/home/widget/background_card.dart';
import 'package:netflix/presentation/home/widget/number_card.dart';
import '../common_widget/home_card.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  ValueNotifier<bool> scrollNotifier = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomePageBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
        body: SafeArea(
            child: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (BuildContext context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  if (state.pastYearMovieList.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.hasError) {
                      return const Center(
                        child: Text("Error while getting data"),
                      );
                    }
                    //release past year
                    final _releasedPastYear = state.pastYearMovieList.map((m) {
                      return "$imageAppendUrl${m.posterPath}";
                    }).toList();
                    _releasedPastYear.shuffle();

                    //treanding
                    final _trending = state.trendingMovieList.map((m) {
                      return "$imageAppendUrl${m.posterPath}";
                    }).toList();
                    _trending.shuffle();

                    //tense drama
                    final _tense = state.tenseMovieList.map((m) {
                      return "$imageAppendUrl${m.posterPath}";
                    }).toList();
                    _tense.shuffle();

                    //tense drama
                    final _southIndian = state.southIndianMovieList.map((m) {
                      return "$imageAppendUrl${m.posterPath}";
                    }).toList();
                    _southIndian.shuffle();

                    //Top 10
                    final _top = state.southIndianMovieList.map((m) {
                      return "$imageAppendUrl${m.posterPath}";
                    }).toList();
                    _southIndian.shuffle();
                    // listview
                    return ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        BackgroundCard(imageUrl: _southIndian[0]),
                        MainTileCard(
                            title: "Released in the past year",
                            posterList: _releasedPastYear),
                        MainTileCard(
                          title: "Trending Now",
                          posterList: _trending,
                        ),
                        NumberCardMainList(
                            title: "Top 10 Tv Shows In India Today",
                            imageList: _top),
                        MainTileCard(title: "Tense Dramas", posterList: _tense),
                        MainTileCard(
                            title: "South Indian Cinemas",
                            posterList: _southIndian),
                      ],
                    );
                  }
                },
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      height: 80,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                "https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png",
                                height: 60,
                                width: 60,
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.cast,
                                color: Colors.white,
                                size: 30,
                              ),
                              kWidth,
                              SizedBox(
                                width: 28,
                                height: 26,
                                child: Image.asset(
                                  "assets/Netflix-avatar.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              kWidth,
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "TV Shows",
                                style: kHomePageTitleStyle,
                              ),
                              Text(
                                "Movies",
                                style: kHomePageTitleStyle,
                              ),
                              Text(
                                "Categories",
                                style: kHomePageTitleStyle,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : kHeight
            ],
          ),
        );
      },
    )));
  }
}
