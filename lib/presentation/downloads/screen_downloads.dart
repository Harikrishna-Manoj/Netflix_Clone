import 'package:flutter/material.dart';

import 'package:netflix/presentation/common_widget/app_bar_widget.dart';
import 'package:netflix/presentation/downloads/widget/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/downloads/downloads_bloc.dart';
import '../../core/colors/colors.dart';
import '../../core/constants/constants.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});
  final _widgetList = [
    const SmartDownloadsWidget(),
    const Section2(),
    const Section3()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(50, 50),
          child: AppBarWidget(title: "Downloads"),
        ),
        body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => _widgetList[index],
            separatorBuilder: (context, index) => const SizedBox(
                  height: 25,
                ),
            itemCount: _widgetList.length));
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });

    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhiteColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          textAlign: TextAlign.center,
          "We'll download a personalised seletion of\nmovies and shows for you, so there's\nalways somethings to watch on your\ndevice.",
          style: TextStyle(color: kGreyColor, fontSize: 15),
        ),
        kHeight,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            if (state.downloads.isEmpty) {             return SizedBox(
                height: size.width * 0.9,
                width: size.width,
                child: const CircularProgressIndicator(),
              );
            } else {
              return SizedBox(
                  height: size.width * 0.9,
                  width: size.width,
                  child: state.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : InkWell(
                          onTap: () {
                            // log("${state.downloads}");
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey.withOpacity(0.5),
                                radius: size.width * 0.38,
                              ),
                              DownloadImageWidget(
                                image:
                                    '$imageAppendUrl${state.downloads[0].posterPath}',
                                margin:
                                    const EdgeInsets.only(left: 180, top: 30),
                                angle: 20,
                                size:
                                    Size(size.width * 0.30, size.width * 0.50),
                              ),
                              DownloadImageWidget(
                                image:
                                    '$imageAppendUrl${state.downloads[1].posterPath}',
                                margin:
                                    const EdgeInsets.only(right: 180, top: 30),
                                angle: -20,
                                size:
                                    Size(size.width * 0.30, size.width * 0.50),
                              ),
                              DownloadImageWidget(
                                image:
                                    '$imageAppendUrl${state.downloads[2].posterPath}',
                                margin: const EdgeInsets.only(),
                                size:
                                    Size(size.width * 0.40, size.width * 0.58),
                              )
                            ],
                          ),
                        ));
            }
          },
        ),
      ],
    );
  }
}
