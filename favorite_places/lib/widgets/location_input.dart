import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import 'package:geocoding/geocoding.dart' as geo;
import 'package:flutter_map/flutter_map.dart';

import 'package:favorite_places/models/place.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onSelectPlace});

  final Function onSelectPlace;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickedLoaction;
  var _isGettingLocation = false;
  final _mapController = MapController();

  Future<List> getLocationAddress(double latitude, double longitude) async {
    List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
      latitude,
      longitude,
    );
    return placemarks;
  }

  Future<void> _savePlace(double latitude, double longitude) async {
    final addressData = await getLocationAddress(latitude, longitude);
    geo.Placemark place = addressData.first;

    final String address =
        '${place.street}, ${place.locality}, ${place.country}, ${place.postalCode}';

    setState(() {
      _pickedLoaction = PlaceLocation(
        latitude: latitude,
        longitude: longitude,
        address: address,
      );
      _isGettingLocation = false;
    });

    widget.onSelectPlace(_pickedLoaction!.latitude, _pickedLoaction!.longitude);
  }

  void _getUserLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lng = locationData.longitude;

    if (lat == null || lng == null) {
      return;
    }

    _savePlace(lat, lng);
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      "No loaction chosen",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );

    if (_pickedLoaction != null) {
      previewContent = FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: LatLng(
            _pickedLoaction!.latitude,
            _pickedLoaction!.longitude,
          ),
          initialZoom: 13,
          interactionOptions: const InteractionOptions(
            flags: InteractiveFlag.none,
          ),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: "com.example.favorite_places",
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(
                  _pickedLoaction!.latitude,
                  _pickedLoaction!.longitude,
                ),
                child: const Icon(Icons.location_on, size: 35.0),
              ),
            ],
          ),
        ],
      );
    }

    if (_isGettingLocation) {
      previewContent = const CircularProgressIndicator();
    }

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.5),
            ),
          ),
          width: double.infinity,
          height: 170,
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getUserLocation,
              icon: const Icon(Icons.location_on),
              label: const Text("Get your location"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text("Map"),
            ),
          ],
        ),
      ],
    );
  }
}
