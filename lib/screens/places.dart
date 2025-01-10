import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_device_features/providers/user_places.dart';
import 'package:native_device_features/screens/add_place.dart';
import 'package:native_device_features/widgets/places_list.dart';

// This is the class where we expect to listen to the state changes
// managed by the riverpod based user_places provider so changed the StatelessWidget
// to ConsumerState.

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

// Here in the Build method we can have access to ref property of type WidgetRef
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //so the ref property has the watch() which helpd us to listen to the
    // state changes in the provider.
    final userPlaces = ref.watch(userPlaceProvider);
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
        body: PlacesList(
          places: userPlaces,
        ));
  }
}
