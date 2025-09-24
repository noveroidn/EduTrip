import 'package:flutter/material.dart';
import 'package:edutrip/widgets/trip_card.dart';
import 'package:edutrip/screens/detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteTrips;

  const FavoriteScreen({super.key, required this.favoriteTrips});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: const Color(0xFF3B82F6),
      ),
      body: favoriteTrips.isEmpty
          ? const Center(
        child: Text(
          "No favorite trips added yet!",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favoriteTrips.length,
        itemBuilder: (context, index) {
          final trip = favoriteTrips[index];
          return TripCard(
            title: trip['title'],
            type: trip['type'],
            thumbnail: trip['thumbnail'],
            isFavorite: trip['isFavorite'],
            onTapFavorite: () {
              // Fitur ini tidak perlu mengubah status favorit karena hanya tampilan
            },
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
    );
  }
}