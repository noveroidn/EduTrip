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
  // Use a local list to manage the favorite state
  late List<Map<String, dynamic>> localTripList;

  @override
  void initState() {
    super.initState();
    // Copy the data from the imported file to a local list
    localTripList = List.from(tripList);
  }

  void toggleFavorite(int index) {
    setState(() {
      localTripList[index]['isFavorite'] = !localTripList[index]['isFavorite'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EduTrip'),
        centerTitle: true,
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
