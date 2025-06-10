import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
      latitude: 22.3039,
      longitude: 70.8022,
      address: '',
    ),
    this.isSelecting = true,
  });

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  void _selectLocation(TapPosition tapPosition, LatLng pos) {
    setState(() {
      _pickedLocation = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isSelecting ? 'Pick your location' : 'Your Location',
        ),
        actions: [
          if (widget.isSelecting)
            IconButton(
              onPressed: () {
                Navigator.of(context).pop(_pickedLocation);
              },
              icon: const Icon(Icons.save),
            ),
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
          onTap: widget.isSelecting ? _selectLocation : null,
          initialCenter: LatLng(
            widget.location.latitude,
            widget.location.longitude,
          ),
          initialZoom: 16,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: "com.example.favorite_places",
          ),
          MarkerLayer(
            markers: [
              Marker(
                point:
                    _pickedLocation ??
                    LatLng(widget.location.latitude, widget.location.longitude),
                child: const Icon(
                  Icons.location_on,
                  size: 40,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
