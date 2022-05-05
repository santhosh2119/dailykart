import 'package:carousel_slider/carousel_slider.dart';
import 'package:daily_kart/base/apis.dart';
import 'package:flutter/material.dart';

class ImageSliderDemo extends StatelessWidget {
  final List<dynamic> imgList;
  const ImageSliderDemo({required this.imgList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 150,
          aspectRatio: 10 / 10,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        items: imgList
            .map((item) => SizedBox(
                  child: Center(
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Image.network(
                      Api.imageUrl + item.toString(),
                      errorBuilder: (context, error, stackTrace) =>
                          Image.asset("assets/images/logo_bw.png"),
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.28,
                    ),
                  )),
                ))
            .toList(),
      ),
    );
  }
}
