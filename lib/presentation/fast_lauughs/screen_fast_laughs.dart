import 'package:flutter/material.dart';
import 'package:netflix/application/fastLaugh/fast_laugh_bloc.dart';
import 'package:netflix/presentation/fast_lauughs/widget/video_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.isError) {
              return const Center(
                child: Text("Error Found"),
              );
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                children: List.generate(
                    state.videosList.length,
                    (index) => VideoListInheritedWidget(
                          widget: VideoItemWidget(
                            index: index,
                            key: Key(index.toString()),
                          ),
                          moviesData: state.videosList[index],
                        )),
              );
            }
          },
        ),
      ),
    );
  }
}
