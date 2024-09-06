import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoReviewPage extends StatelessWidget {
  final String videoId;
  final String reviewText;

  const VideoReviewPage(
      {super.key, required this.videoId, required this.reviewText});

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          reviewText,
          style: const TextStyle(fontSize: 16.0),
        ),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200, // Adjust the height as needed
              child: YoutubePlayer(
                controller: controller,
                showVideoProgressIndicator: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
