import 'dart:io';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PickLocation {
  const PickLocation(
      {required this.latitude, required this.longitude, required this.address});
  final double latitude;
  final double longitude;
  final String address;
}

class Place {
  Place({required this.title, required this.image, required this.pickLocation})
      : id = uuid.v4();

  final String id;
  final String title;
  final File image;
  final PickLocation pickLocation;
}
