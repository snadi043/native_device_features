import 'package:flutter/material.dart';
import 'package:native_device_features/screens/add_place.dart';
import 'package:native_device_features/widgets/places_list.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Places'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const AddPlaceScreen()),
                  );
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        body: const PlacesList(
          places: [],
        ));
  }
}
