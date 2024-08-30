
class Beach {
  final String name;
  final String location;
  final String description;
  final double latitude;
  final double longitude;
  final String imageUrl;

  const Beach({
    required this.name,
    required this.location,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.imageUrl,
  });

  factory Beach.fromJson(Map<String, dynamic> json) {
    return Beach(
      name: json['name'] as String,
      location: json['location'] as String,
      description: json['description'] as String? ?? '',
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'location': location,
    'description': description,
    'latitude': latitude,
    'longitude': longitude,
    'imageUrl': imageUrl,
  };

  Beach copyWith({
    String? name,
    String? location,
    String? description,
    double? latitude,
    double? longitude,
    String? imageUrl,
  }) {
    return Beach(
      name: name ?? this.name,
      location: location ?? this.location,
      description: description ?? this.description,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Beach &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              location == other.location &&
              description == other.description &&
              latitude == other.latitude &&
              longitude == other.longitude &&
              imageUrl == other.imageUrl;

  @override
  int get hashCode => Object.hash(name, location, description, latitude, longitude, imageUrl);

  @override
  String toString() => 'Beach(name: $name, location: $location, latitude: $latitude, longitude: $longitude, imageUrl: $imageUrl)';
}
