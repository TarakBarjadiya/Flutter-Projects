import 'package:favorite_places/providers/user_places_provider.dart';
import 'package:favorite_places/screens/add_place_screen.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePlacesScreen extends ConsumerStatefulWidget {
  const FavoritePlacesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _FavoritePlacesScreen();
  }
}

class _FavoritePlacesScreen extends ConsumerState<FavoritePlacesScreen> {
  late Future _futurePlaces;

  @override
  void initState() {
    super.initState();
    _futurePlaces = ref.read(userPlaceProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final userPlaces = ref.watch(userPlaceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (cntx) => const AddPlaceScreen()),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _futurePlaces,
          builder: (context, asyncSnapshot) {
            return asyncSnapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : PlacesList(places: userPlaces);
          },
        ),
      ),
    );
  }
}
