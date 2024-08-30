// lib/screens/beach_list_screen.dart

import 'package:flutter/material.dart';
import '../models/beach.dart';
import '../providers/beach_provider.dart';
import 'beach_detail_screen.dart';

class BeachListScreen extends StatelessWidget {
  const BeachListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a location parameter or obtain it dynamically
    const String location = 'desired_location'; // Replace with actual location

    return Scaffold(
      appBar: AppBar(
        title: const Text('Beaches'),
      ),
      body: FutureBuilder<List<Beach>>(
        future: BeachProvider.fetchBeaches(location),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return BeachListView(beaches: snapshot.data!);
          } else {
            return const Center(child: Text('No beaches available'));
          }
        },
      ),
    );
  }
}

class BeachListView extends StatelessWidget {
  final List<Beach> beaches;

  const BeachListView({super.key, required this.beaches});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: beaches.length,
      itemBuilder: (context, index) {
        final beach = beaches[index];
        return BeachListTile(beach: beach);
      },
    );
  }
}

class BeachListTile extends StatelessWidget {
  final Beach beach;

  const BeachListTile({super.key, required this.beach});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(beach.name),
      subtitle: Text(beach.location),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BeachDetailScreen(beach: beach),
          ),
        );
      },
    );
  }
}
