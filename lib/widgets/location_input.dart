import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() {
    return _LocationInput();
  }
}

class _LocationInput extends State<LocationInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 180,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.2))),
          child: Text(
            'No location found yet.',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.location_city),
                label: const Text('Pick your location')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.map),
                label: const Text('Pick from map'))
          ],
        )
      ],
    );
  }
}
