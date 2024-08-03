import 'package:flutter/material.dart';
import 'package:native_device_features/screens/add_places.dart';
import 'package:native_device_features/widgets/places_list.dart';

class Places extends StatelessWidget {
  const Places({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => const AddPlaces()));
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: const PlacesList(places: []),
    );
  }
}
