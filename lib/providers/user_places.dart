import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_device_features/models/place.dart';

import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as localpath;

import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

//StateNotifier is the riverpod provided generic type and in this case since we
//expect places of the type Place defined in the model Place which is being used here
// as the generic data type.

// const[] is basically the initial state value of the Provider

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

//addPlaces is the method we want to manage the adding of places feature
//in the app which expects title and image as a parameters
// newPlace takes the newly adding place based on the Place model and then it gets
// added to the previous exisiting state by doing object destrucutring.

  void addPlaces(String title, File image, PickLocation location) async {
    final Directory appDir = await syspaths
        .getApplicationDocumentsDirectory(); // Using the installed path provider package to access the document directory methos which helps to store data locally.
    final filename = localpath.basename(image
        .path); // using the paths package to construct the local file names for the data which we are tying to save in the devices locally.
    final imagePath = await image.copy(
        '${appDir.path}/$filename'); // This is the final file directory to save the images locally on the device and it is passed to image property on the provider.

    await sql.openDatabase('user_places',
        version: 1, onCreate: ((db, version) => async {
          await db.execute('CREATE TABLE user_places (id INTEGER PRIMARY KEY, title TEXT, image TEXT, lat REAL, lng REAL, address TEXT)'),
        }));

    final newPlace =
        Place(title: title, image: imagePath, pickLocation: location);
    state = [newPlace, ...state];

    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(dbPath, onCreate: (db, version) => {
      db.execute('CREATE TABLE user_places(id INTEGER PRIMARY KEY, title TEXT, image TEXT, lat REAL. lng REAL, address TEXT'),
    },
    version : 1,
    );
    
    await db.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'lat': newPlace.pickLocation.latitude,
      'lng': newPlace.pickLocation.longitude,
      'address': newPlace.pickLocation.address,
    });
  }
}

//Here you register your userPlacesProvider with the help of StateNotifierProvider
// and configuring your type of the data in here which is your Notifier class.

final userPlaceProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());
