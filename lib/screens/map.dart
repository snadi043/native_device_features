import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:native_device_features/models/place.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({
    super.key,
    this.location = const PickLocation(
        latitude: 37.4279, longitude: -122.0857, address: ''),
    this.isPickingLocation = true,
  });

  final PickLocation location;
  final bool isPickingLocation;

  @override
  State<MapsScreen> createState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends State<MapsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.isPickingLocation
              ? 'Pick your Location'
              : 'Your location'),
          actions: [
            if (widget.isPickingLocation)
              IconButton(onPressed: () {}, icon: const Icon(Icons.save)),
          ],
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
              target:
                  LatLng(widget.location.latitude, widget.location.longitude),
              zoom: 16),
          markers: {
            Marker(
                markerId: const MarkerId('m1'),
                position: LatLng(
                    widget.location.latitude, widget.location.longitude)),
          },
        ));
  }
}
