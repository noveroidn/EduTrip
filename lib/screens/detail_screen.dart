import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:edutrip/data/trip_data.dart';
// Import widget baru
import 'package:edutrip/widgets/recommended_card.dart';

class DetailScreen extends StatefulWidget {
  final String title;
  final String thumbnail;
  final String videoUrl;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumbnail,
    required this.videoUrl,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          YoutubePlayer(controller: _controller, showVideoProgressIndicator: true),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              "Rekomendasi Lainnya",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: recommendedTrips.length,
              itemBuilder: (context, index) {
                final trip = recommendedTrips[index];
                // Menggunakan RecommendedCard di sini
                return RecommendedCard(
                  title: trip['title'],
                  type: trip['type'],
                  thumbnail: trip['thumbnail'],
                  onTapCard: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(
                          title: trip['title'],
                          thumbnail: trip['thumbnail'],
                          videoUrl: trip['videoUrl'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}