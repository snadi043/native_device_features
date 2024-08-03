import 'package:flutter/material.dart';
import 'package:native_device_features/models/place_model.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});
  final List<PlaceModel> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
          child: Text(
        'No places found',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ));
    }
    return ListView.builder(
        itemBuilder: (ctx, index) => ListTile(
            title: Text(places[index].title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground))));
  }
}
