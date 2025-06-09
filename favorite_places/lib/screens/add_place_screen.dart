import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart' as geo;

import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';

import 'package:favorite_places/providers/user_places_provider.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _placeTitleController = TextEditingController();
  File? _pickedImage;
  PlaceLocation? _selectedPlace;

  Future<List> getLocationAddress(double latitude, double longitude) async {
    List<geo.Placemark> placemark = await geo.placemarkFromCoordinates(
      latitude,
      longitude,
    );
    return placemark;
  }

  void _selectPlace(double latitude, double longitude) async {
    final addressData = await getLocationAddress(latitude, longitude);
    geo.Placemark place = addressData.first;

    final String address =
        '${place.street}, ${place.locality}, ${place.country}, ${place.postalCode}';

    setState(() {
      _selectedPlace = PlaceLocation(
        latitude: latitude,
        longitude: longitude,
        address: address,
      );
    });
  }

  void _savePlace() {
    final enteredTitle = _placeTitleController.text.trim();

    if (enteredTitle.isEmpty ||
        _pickedImage == null ||
        _selectedPlace == null) {
      return;
    }

    ref
        .read(userPlaceProvider.notifier)
        .addPlace(enteredTitle, _pickedImage!, _selectedPlace!);

    Navigator.of(context).pop();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Place added")));
  }

  @override
  void dispose() {
    _placeTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add a place")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _placeTitleController,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(label: Text("Place Name")),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              ImageInput(
                onSeleceImage: (image) {
                  _pickedImage = image;
                },
              ),
              const SizedBox(height: 18),
              LocationInput(onSelectPlace: _selectPlace),
              ElevatedButton.icon(
                onPressed: _savePlace,
                icon: const Icon(Icons.add),
                label: const Text("Add Place"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
