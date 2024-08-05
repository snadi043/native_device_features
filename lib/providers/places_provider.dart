import 'package:native_device_features/models/place_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesNotifier extends StateNotifier<List<PlaceModel>> {
  PlacesNotifier() : super(const []);

  void addPlaces(String title) {
    final newPlace = PlaceModel(title: title);
    state = [...state, newPlace];
  }

  final placesProvider =
      StateNotifierProvider<PlacesNotifier, List<PlaceModel>>((ref) {
    return PlacesNotifier();
  });
}
