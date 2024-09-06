import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:universe_it_project/utils/app_config.dart';


class Splash extends StatelessWidget {
  Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
                height: screenSize.height / 1,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppConfig.appLogo,
                        width: screenSize.width / 3),
                    AnimatedTextKit(
                      animatedTexts: [
                        RotateAnimatedText(AppConfig.appName,
                            textStyle: const TextStyle(
                                fontSize: 20.0, color: Colors.black),
                            duration: const Duration(seconds: 5))
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
