import 'package:flutter/material.dart';
import 'package:edutrip/data/trip_data.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    // Ambil hanya data yang isFavorite == true
    final favoriteTrips =
    tripList.where((trip) => trip['isFavorite'] == true).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3B82F6),
        title: const Text(
          "My Favorites",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: favoriteTrips.isEmpty
          ? const Center(
        child: Text(
          "Belum ada favorit",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favoriteTrips.length,
        itemBuilder: (context, index) {
          final item = favoriteTrips[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Image.network(
                item['thumbnail'],
                width: 60,
                fit: BoxFit.cover,
              ),
              title: Text(item['title']),
              subtitle: Text(item['type']),
            ),
          );
        },
      ),
    );
  }
}
