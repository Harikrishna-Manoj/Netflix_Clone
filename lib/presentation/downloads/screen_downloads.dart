import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/common_widget/app_bar_widget.dart';
import '../../core/colors/colors.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});
  final _widgetList = [
    const _SmartDownloadsWidget(),
    _Section2(),
    const _Section3()
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

class _SmartDownloadsWidget extends StatelessWidget {
  const _SmartDownloadsWidget();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Icon(
            Icons.settings,
            color: kWhiteColor,
          ),
          Text("Smart Downloads")
        ],
      ),
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget(
      {super.key,
      required this.image,
      this.angle = 0,
      required this.margin,
      required this.size});

  final String image;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: unused_element
class _Section2 extends StatelessWidget {
  _Section2();
  final imageList = [
    "https://www.themoviedb.org/t/p/w220_and_h330_face/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/1E5baAaEse26fej7uHcjOgEE2t2.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/r2J02Z2OpNTctfOSN1Ydgii51I3.jpg"
  ];
  @override
  Widget build(BuildContext context) {
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
        SizedBox(
          height: size.width * 0.9,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
                radius: size.width * 0.38,
              ),
              DownloadImageWidget(
                image: imageList[0],
                margin: const EdgeInsets.only(left: 180, top: 30),
                angle: 20,
                size: Size(size.width * 0.30, size.width * 0.50),
              ),
              DownloadImageWidget(
                image: imageList[1],
                margin: const EdgeInsets.only(right: 180, top: 30),
                angle: -20,
                size: Size(size.width * 0.30, size.width * 0.50),
              ),
              DownloadImageWidget(
                image: imageList[2],
                margin: const EdgeInsets.only(),
                size: Size(size.width * 0.40, size.width * 0.58),
              )
            ],
          ),
        ),
      ],
    );
  }
}

// ignore: unused_element
class _Section3 extends StatelessWidget {
  const _Section3();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          color: kButtonColorBlue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {},
          child: const SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set up",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: kButtonColorWhite,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
          ),
        )
      ],
    );
  }
}
