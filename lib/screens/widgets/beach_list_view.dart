import 'package:flutter/material.dart';
import '../../models/beach.dart';
import '../beach_detail_screen.dart';

class BeachListView extends StatelessWidget {
  final List<Beach> beaches;

  const BeachListView({super.key, required this.beaches});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: beaches.length,
      itemBuilder: (context, index) {
        final beach = beaches[index];
        return Card(
          elevation: 8.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16.0),
            leading: const Icon(Icons.beach_access, color: Colors.teal),
            title: Text(beach.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(beach.location),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BeachDetailScreen(beach: beach),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
