import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

ValueNotifier<Set<int>> likedVideoIdNotifier = ValueNotifier({});

class VideoListInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads moviesData;

  const VideoListInheritedWidget(
      {super.key, required this.moviesData, required this.widget})
      : super(child: widget);

  @override
  bool updateShouldNotify(covariant VideoListInheritedWidget oldWidget) {
    return oldWidget.moviesData != moviesData;
  }

  static VideoListInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListInheritedWidget>();
  }
}

class VideoItemWidget extends StatelessWidget {
  const VideoItemWidget({super.key, required this.index});
  // ignore: prefer_typing_uninitialized_variables
  final index;

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListInheritedWidget.of(context)!.moviesData.posterPath;
    final videoUrl = videoUrls[index % videoUrls.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(
          videoUrl: videoUrl,
          // ignore: avoid_types_as_parameter_names
          onStateChange: (bool) {},
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(
                    icon: const Icon(
                      Icons.volume_off,
                      color: kWhiteColor,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                        radius: 25,
                        backgroundImage: posterPath == null
                            ? const NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOnfxQ7lfUgJCoQmmimskKpiOHKNpu0NARAQ&usqp=CAUhttps://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOnfxQ7lfUgJCoQmmimskKpiOHKNpu0NARAQ&usqp=CAU")
                            : NetworkImage("$imageAppendUrl$posterPath")),
                    kHeight,
                    ValueListenableBuilder(
                      valueListenable: likedVideoIdNotifier,
                      builder: (context, Set<int> newLikedListIds, child) {
                        final _index = index;
                        if (newLikedListIds.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              likedVideoIdNotifier.value.remove(_index);
                              // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                              likedVideoIdNotifier.notifyListeners();
                            },
                            child: const VideoActionsWidget(
                                icon: Icons.favorite, title: "Liked"),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            likedVideoIdNotifier.value.add(_index);
                            // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                            likedVideoIdNotifier.notifyListeners();
                          },
                          child: const VideoActionsWidget(
                              icon: Icons.emoji_emotions, title: "LOL"),
                        );
                      },
                    ),
                    const VideoActionsWidget(icon: Icons.add, title: 'My List'),
                    GestureDetector(
                      onTap: () {
                        final movieName = VideoListInheritedWidget.of(context)
                                ?.moviesData
                                .title ??
                            VideoListInheritedWidget.of(context)!
                                .moviesData
                                .title;
                        if (movieName != null) {
                          Share.share(movieName);
                        }
                      },
                      child: const VideoActionsWidget(
                          icon: Icons.share_outlined, title: 'Share'),
                    ),
                    const VideoActionsWidget(
                        icon: Icons.play_arrow, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  const VideoActionsWidget(
      {super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhiteColor,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: kWhiteColor),
          )
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChange;
  const FastLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onStateChange});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: _videoPlayerController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
