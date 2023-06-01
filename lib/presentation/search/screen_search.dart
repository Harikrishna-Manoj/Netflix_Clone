import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/search/widget/search_idle.dart';
import 'package:netflix/presentation/search/widget/search_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          CupertinoSearchTextField(
            onChanged: (value) {
              BlocProvider.of<SearchBloc>(context)
                  .add(SearchMovie(movieQuery: value));
            },
            backgroundColor: Colors.grey.withOpacity(0.3),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: Colors.grey,
            ),
            style: const TextStyle(color: Colors.white),
          ),
          kHeight,
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.searchResultList.isEmpty) {
                // print("${state.idleList}");
                return const Expanded(child: SearchIdleWidget());
              } else {
                return const Expanded(child: SearchResultPage());
              }
            },
          ),
        ],
      ),
    )));
  }
}
