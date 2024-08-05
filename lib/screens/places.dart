import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_device_features/providers/places_provider.dart';
import 'package:native_device_features/screens/add_places.dart';
import 'package:native_device_features/widgets/places_list.dart';

class Places extends ConsumerWidget {
  const Places({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(PlacesNotifier().placesProvider);
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
      body: PlacesList(places: userPlaces),
    );
  }
}
