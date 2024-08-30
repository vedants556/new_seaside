import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/config.dart';
import '../models/beach.dart';

class BeachProvider {
  static const _mockDelay = Duration(seconds: 2);

  static Future<List<Beach>> fetchBeaches(String searchQuery) async {
    if (Config.useMockData) {
      return _fetchMockBeaches();
    } else {
      return _fetchRealBeaches(searchQuery);
    }
  }

  static Future<Beach> fetchBeachDetails(String name) async {
    if (Config.useMockData) {
      return _fetchMockBeachDetails(name);
    } else {
      return _fetchRealBeachDetails(name);
    }
  }

  static Future<List<Beach>> _fetchMockBeaches() async {
    await Future.delayed(_mockDelay);
    return [
      const Beach(
        name: 'Goa Beach',
        location: 'Goa, India',
        description: 'A popular beach destination with vibrant nightlife.',
        latitude: 15.2993,
        longitude: 74.1240,
        imageUrl: 'https://thumbs.dreamstime.com/b/tropical-sunny-beach-party-sunset-sun-umbrellas-lounge-chairs-goa-india-tropical-sunny-beach-party-sunset-goa-203861442.jpg',
      ),
      const Beach(
        name: 'Kovalam Beach',
        location: 'Kerala, India',
        description: 'Known for its crescent-shaped beaches and serene atmosphere.',
        latitude: 8.4076,
        longitude: 76.9828,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSf9eu9K8mDlRB1gSWGpeNc1Mbp6CZY_sgTCg&s',
      ),
      const Beach(
        name: 'Marina Beach',
        location: 'Chennai, India',
        description: 'One of the longest urban beaches in India, with a bustling atmosphere.',
        latitude: 13.0520,
        longitude: 80.2555,
        imageUrl: 'https://chennaitourism.travel/images/places-to-visit/headers/marina-beach-chennai-tourism-entry-fee-timings-holidays-reviews-header.jpg',
      ),
      const Beach(
        name: 'Juhu Beach',
        location: 'Mumbai, India',
        description: 'Juhu is among the most expensive and affluent areas of the metropolitan area and home to many Bollywood celebrities.',
        latitude: 19.1048,
        longitude: 72.8267,
        imageUrl: 'https://a.travel-assets.com/findyours-php/viewfinder/images/res70/111000/111503-Juhu-Beach.jpg',
      ),
      const Beach(
        name: 'Versova Beach',
        location: 'Mumbai, India',
        description: 'A popular beach destination with vibrant nightlife.',
        latitude: 19.1545,
        longitude: 72.8292,
        imageUrl: 'https://mumbaitourism.travel/images/places-to-visit/headers/versova-beach-mumbai-indian-tourism-entry-fee-timings-holidays-reviews-header.jpg',
      ),
      const Beach(
        name: 'Marine Drive',
        location: 'Mumbai, India',
        description: 'Known as the Queens Necklace, is a famous promenade in Mumbai, India.',
        latitude: 18.9408,
        longitude: 72.8258,
        imageUrl: 'https://static.wanderon.in/wp-content/uploads/2024/04/marine-drive-2.jpg',
      ),
      const Beach(
        name: 'Aksa Beach',
        location: 'Mumbai, India',
        description: 'A popular beach destination with vibrant nightlife.',
        latitude: 19.2436,
        longitude: 72.8306,
        imageUrl: 'https://media1.thrillophilia.com/filestore/pcsj4hsuo3wngq2g4xevg39m3adg_1524228784_Aksa_Beach.jpg',
      ),
      const Beach(
        name: 'Alibag Beach',
        location: 'Raigad, India',
        description: 'A popular beach destination with vibrant nightlife.',
        latitude: 18.6406,
        longitude: 72.8328,
        imageUrl: 'https://saibabatravels.com/wp-content/uploads/2019/08/699699985Alibaug_Main.jpg',
      ),
      const Beach(
        name: 'Ganpatipule Beach',
        location: 'Ratnagiri, India',
        description: 'It is renowned for its immaculate white sand, glistening sea, and breathtaking Arabian Sea views.',
        latitude: 17.5264,
        longitude: 81.7364,
        imageUrl: 'https://www.mtdc.co.in/wp-content/uploads/2019/11/ganpatipule-beach-banner-1.jpg',
      ),
      const Beach(
        name: 'Dadar Beach',
        location: 'Mumbai, India',
        description: 'A popular beach destination with vibrant nightlife.',
        latitude: 19.0168,
        longitude: 72.8347,
        imageUrl: 'https://images.squarespace-cdn.com/content/v1/559c07bee4b0c25a8fb0ba71/1688567076376-71TJSIFAZ8BZMQ4SJ0PU/istock-1200979659-1-1604469320.jpg?format=1500w',
      ),
      const Beach(
        name: 'Madh Island Beach',
        location: 'Mumbai, India',
        description: 'A popular beach destination with vibrant nightlife.',
        latitude: 19.2315,
        longitude: 72.8440,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3983zchR0h2YlzcP8cUbnHFcywb4NXf4aqA&s',
      ),
      const Beach(
        name: 'Diveagar Beach',
        location: 'Raigad, India',
        description: 'A popular beach destination with vibrant nightlife.',
        latitude: 18.2197,
        longitude: 72.9790,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3983zchR0h2YlzcP8cUbnHFcywb4NXf4aqA&s',
      ),
      const Beach(
        name: 'Kashid Beach',
        location: 'Raigad, India',
        description: 'A popular beach destination with vibrant nightlife.',
        latitude: 18.6364,
        longitude: 72.9630,
        imageUrl: 'https://media-cdn.tripadvisor.com/media/photo-s/0e/ef/5b/19/20170408-073656-largejpg.jpg',
      ),
      const Beach(
        name: 'Harihareshwar Beach',
        location: 'Raigad, India',
        description: 'A popular beach destination with vibrant nightlife.',
        latitude: 18.7211,
        longitude: 73.2892,
        imageUrl: 'https://www.trawell.in/admin/images/upload/69969981Alibaug_Harihareshwar_Beach_Main.jpg',
      ),
      const Beach(
        name: 'Manori Beach',
        location: 'Mumbai, India',
        description: 'A popular beach destination with vibrant nightlife.',
        latitude: 19.2365,
        longitude: 72.8356,
        imageUrl: 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhJuL-hT-s70FMDW73w-sdOcgKAhZ2NH7hLJZAlzuE-gkYziOGO1yMHbSnp1vFxR6QHNt8y1mTeK3KpMKEUgEojmx_ecttCHUYuTTwJfCLDTvFW1hk7M3UF5ceGaY1IoTiETTxyR8LGFWf2/s1600/1.jpg',
      ),
      const Beach(
        name: 'Guhagar Beach',
        location: 'Ratnagiri, India',
        description: 'A popular beach destination with vibrant nightlife.',
        latitude: 17.4977,
        longitude: 73.1536,
        imageUrl: 'https://media1.thrillophilia.com/filestore/4a7lmh2itnj0ezwne5bm1rc9ib83_1589870661_shutterstock_1280937280.jpg?w=400&dpr=2',
      ),
      const Beach(
        name: 'Vengurla Beach',
        location: 'Sindhudurg, India',
        description: 'A popular beach destination with vibrant nightlife.',
        latitude: 15.8941,
        longitude: 73.6452,
        imageUrl: 'https://images.travelandleisureasia.com/wp-content/uploads/sites/2/2020/11/Feature-image-Vengurla.jpg?tr=w-1200,q-60',
      ),
      const Beach(
        name: 'Bhatye Beach',
        location: 'Ratnagiri, India',
        description: 'A popular beach destination with vibrant nightlife.',
        latitude: 16.9817,
        longitude: 73.2893,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlxqaVkZ6c6zfye3vLSFaCf6FXVi-mI_taEw&s',
      ),
      const Beach(
        name: 'Tarkarli Beach',
        location: 'Sindhudurg, India',
        description: 'A popular beach destination with vibrant nightlife.',
        latitude: 16.0250,
        longitude: 73.4267,
        imageUrl: 'https://www.mtdc.co.in/wp-content/uploads/2019/11/1-1.jpg',
      ),
      const Beach(
        name: 'Kihim Beach',
        location: 'Raigad, India',
        description: 'A popular beach destination with vibrant nightlife.',
        latitude: 18.6655,
        longitude: 72.9734,
        imageUrl: 'https://static2.tripoto.com/media/filter/tst/img/1616873/TripDocument/1565778518_kihimbeach_1024x498.jpg',
      ),
      const Beach(
        name: 'Dapoli Beach',
        location: 'Ratnagiri, India',
        description: 'A popular beach destination with vibrant nightlife.',
        latitude: 17.7490,
        longitude: 73.1158,
        imageUrl: 'https://lh3.googleusercontent.com/proxy/3V6snkGC13GSw-J8bu7qcZgVmFsy4pE1anl5T5SWgCLnzOs7YzRIC56ApjKViOfE9LWBjHG7xvTFWUB97HZeLbJ2eTTUORoYk-0u43x42Uik5rL5Id_jOhEaCAo',
      ),
    ];
  }

  static Future<List<Beach>> _fetchRealBeaches(String searchQuery) async {
    final response = await http.get(Uri.parse('${Config.beachesEndpoint}?search=$searchQuery'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Beach.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load beaches');
    }
  }

  static Future<Beach> _fetchMockBeachDetails(String name) async {
    await Future.delayed(_mockDelay);
    return const Beach(
      name: 'Goa Beach',
      location: 'Goa, India',
      description: 'A popular beach destination with vibrant nightlife.',
      latitude: 15.2993,
      longitude: 74.1240,
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmxdMhCQbQMjvN_s7bP86CcgWFrR80nBne1g&s',
    );
  }

  static Future<Beach> _fetchRealBeachDetails(String name) async {
    final response = await http.get(Uri.parse('${Config.beachesEndpoint}/$name'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Beach.fromJson(data);
    } else {
      throw Exception('Failed to fetch beach details');
    }
  }
}
