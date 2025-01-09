import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  final titleInputController = TextEditingController();

  @override
  void dispose() {
    titleInputController.dispose();
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
                controller: titleInputController,
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                label: const Text('Add Place'),
                icon: const Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}
