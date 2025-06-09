import 'dart:io';

import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/providers/user_places_provider.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _placeTitleController = TextEditingController();
  File? _pickedImage;

  void _savePlace() {
    final enteredTitle = _placeTitleController.text.trim();

    if (enteredTitle.isEmpty || _pickedImage == null) {
      return;
    }

    ref.read(userPlaceProvider.notifier).addPlace(enteredTitle, _pickedImage!);

    Navigator.of(context).pop();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Place added")));
  }

  @override
  void dispose() {
    _placeTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add a place")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _placeTitleController,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(label: Text("Place Name")),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            ImageInput(
              onSeleceImage: (image) {
                _pickedImage = image;
              },
            ),
            SizedBox(height: 18),
            LocationInput(),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: Icon(Icons.add),
              label: Text("Add Place"),
            ),
          ],
        ),
      ),
    );
  }
}
