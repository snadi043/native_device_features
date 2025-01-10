import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_device_features/models/place.dart';

//StateNotifier is the riverpod provided generic type and in this case since we
//expect places of the type Place defined in the model Place which is being used here
// as the generic data type.

// const[] is basically the initial state value of the Provider

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

//addPlaces is the method we want to manage the adding of places feature
//in the app which expects title as a parameter
// newPlace takes the newly adding place based on the Place model and then it gets
// added to the previous exisiting state by doing object destrucutring.

  void addPlaces(String title) {
    final newPlace = Place(title: title);
    state = [newPlace, ...state];
  }
}

//Here you register your userPlacesProvider with the help of StateNotifierProvider
// and configuring your type of the data in here which is your Notifier class.

final userPlaceProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());
