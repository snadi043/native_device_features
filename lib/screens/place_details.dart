import 'package:flutter/material.dart';
import 'package:native_device_features/models/place.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key, required this.places});

  final Place places;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(places.title),
        ),
        body: Stack(
          children: [
            Image.file(
              places.image,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ],
        ));
  }
}
