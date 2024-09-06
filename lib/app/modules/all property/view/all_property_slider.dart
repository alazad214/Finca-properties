import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/cupertino.dart';

class AllPropertySlider extends StatelessWidget {
  const AllPropertySlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140.0,
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: const BoxDecoration(),
        child: AnotherCarousel(dotSize: 4, dotSpacing: 10, images: [
          for (int i = 1; i < 10; i++)
            Image.asset(
              "assets/images/flat.jpg",
              fit: BoxFit.cover,
            ),
        ]));
  }
}
