import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_device_features/providers/user_places.dart';
import 'package:native_device_features/widgets/image_input.dart';

//Changing the StatefulWidget to ConsumerStatefulWidget to accept the
//methods written in the providers file which is based on riverpod state
//managemet library.

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

//once the StatefulWidget is changed to ConsumerStatefulWidget
// createState accepts its import from ConsumerState so the State is changed
// to ConsumerState.

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddPlaceScreen();
  }
}

//Also here the State is changed to ConsumerState
class _AddPlaceScreen extends ConsumerState<AddPlaceScreen> {
  File? _selectedImage;

  final _titleInputController = TextEditingController();

  void addPlace() {
    final enteredTitle = _titleInputController.text;

    if (enteredTitle.isEmpty || _selectedImage == null) {
      return;
    }

    //ref property is provided by the riverpod ConsumerState and
    // ref has the read property which accepts a notifier which we
    // created in the user_places provider file and exported from there
    // and from there we can make use of the methods.

    ref
        .read(userPlaceProvider.notifier)
        .addPlaces(enteredTitle, _selectedImage!);

    // once the user enters the value they have to be moved to other screen
    // so we use pop() from the navigator.
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Places'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground),
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleInputController,
              ),
              const SizedBox(height: 8),
              ImageInput(
                onSelectImage: (image) {
                  _selectedImage = image;
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                label: const Text('Add Place'),
                icon: const Icon(Icons.add),
                onPressed: addPlace,
              ),
            ],
          ),
        ));
  }
}
