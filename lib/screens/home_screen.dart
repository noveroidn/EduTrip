import 'package:edutrip/screens/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:edutrip/widgets/trip_card.dart';
import 'package:edutrip/screens/detail_screen.dart';
import 'package:edutrip/data/trip_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Map<String, dynamic>> localTripList;

t

  void toggleFavorite(int index) {
    setState(() {
      localTripList[index]['isFavorite'] = !localTripList[index]['isFavorite'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteTrips = localTripList.where((trip) => trip['isFavorite'] == true).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3B82F6),
        title: const Text(
          "EduTrip",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteScreen(favoriteTrips: favoriteTrips),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: localTripList.length,
        itemBuilder: (context, index) {
          final trip = localTripList[index];
          return TripCard(
            title: trip['title'],
            type: trip['type'],
            thumbnail: trip['thumbnail'],
            isFavorite: trip['isFavorite'],
            onTapFavorite: () => toggleFavorite(index),
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