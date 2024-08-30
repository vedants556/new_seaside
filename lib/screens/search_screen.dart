import 'package:flutter/material.dart';
import '../models/beach.dart';
import '../providers/beach_provider.dart';
import 'beach_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Beach> allBeaches = [];
  List<Beach> filteredBeaches = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBeaches();
  }

  Future<void> _loadBeaches() async {
    final beaches = await BeachProvider.fetchBeaches('');
    setState(() {
      allBeaches = beaches;
      filteredBeaches = beaches;
      isLoading = false;
    });
  }

  void _filterBeaches(String query) {
    setState(() {
      filteredBeaches = allBeaches
          .where((beach) =>
      beach.name.toLowerCase().contains(query.toLowerCase()) ||
          beach.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Beaches', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: _filterBeaches,
              decoration: InputDecoration(
                hintText: 'Search beaches...',
                prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : filteredBeaches.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.beach_access, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text(
                    'No matching beaches found.',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                ],
              ),
            )
                : ListView.builder(
              itemCount: filteredBeaches.length,
              itemBuilder: (context, index) {
                final beach = filteredBeaches[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(beach.imageUrl),
                      radius: 30,
                    ),
                    title: Text(
                      beach.name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      beach.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
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
            ),
          ),
        ],
      ),
    );
  }
}
