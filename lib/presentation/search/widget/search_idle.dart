import 'package:flutter/material.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/search/widget/title.dart';
import 'package:text_scroll/text_scroll.dart';
import '../../../core/constants/constants.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleWidget(title: "Top Searches"),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isError) {
                return const Center(
                  child: Text("Error Occured"),
                );
              } else if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text("List is Empty"),
                );
              }
              return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final movie = state.idleList[index];
                    return TopSearchItemTile(
                      imageUrl: "$imageAppendUrl${movie.posterPath}",
                      title: movie.title ?? "Movie Title",
                    );
                  },
                  separatorBuilder: (context, index) => kHeight20,
                  itemCount: state.idleList.length);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile(
      {super.key, required this.imageUrl, required this.title});
  final String title;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
            width: screenWidth * 0.35,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl)),
            )),
        kWidth,
        Expanded(
          child: TextScroll(
            mode: TextScrollMode.endless,
            velocity: const Velocity(pixelsPerSecond: Offset(30, 0)),
            title,
            style: const TextStyle(
                color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const Icon(
          Icons.play_circle_outline_outlined,
          color: Colors.white,
          size: 60,
        ),
      ],
    );
  }
}
