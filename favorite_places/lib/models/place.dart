import 'dart:io';
import 'package:uuid/uuid.dart';

final uuid = const Uuid();

class PlaceLocation {
  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  final double latitude;
  final double longitude;
  final String address;
}

class Place {
  Place({
    required this.name,
    required this.image,
    required this.location,
    String? id,
  }) : id = id ?? uuid.v4();

  final String id;
  final String name;
  final File image;
  final PlaceLocation location;
}
