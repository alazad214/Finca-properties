import 'package:flutter/material.dart';
import 'package:universe_it_project/app/modules/client%20review/views/video_screen.dart';
import 'package:universe_it_project/widgets/custom_card.dart';
import 'package:universe_it_project/widgets/custom_text.dart';

import '../controller/video_utils.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Customer Reviews",
            fontsize: 20.0,
            fontweight: FontWeight.bold,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: videoData.length,
              itemBuilder: (_, index) {
                final video = videoData[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoReviewPage(
                            videoId: video['videoId']!,
                            reviewText: video['review']!,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 150.0,
                      width: 220.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/flat.jpg"),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // Gradient overlay
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.1),
                                    Colors.black.withOpacity(0.7),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Play icon and review text
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 15.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.play_circle_fill,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                const SizedBox(height: 5),
                                CustomText(
                                  text: video['review']!,
                                  maxline: 2,
                                  color: Colors.white,
                                  fontsize: 16.0,
                                  fontweight: FontWeight.w500,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
