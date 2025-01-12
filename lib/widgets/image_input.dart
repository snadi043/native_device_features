import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() {
    return _ImageInput();
  }
}

class _ImageInput extends State<ImageInput> {
  // The File format has to be imported from the 'dart.io' which is done in the
  //imports section in the top of the file line 1.
  // The File format cannot be null so ? is added for the File.
  File? _selectedImage;

  // ImagePicker returns a future value so the function is made asyn and await
  // for the result and handling the result then after.

  void _takePicture() async {
    // Initializing the ImagePicker from the ImagePicker package installed.
    final ImagePicker imagePicker = ImagePicker();

    // Utilizing the ImagePicker method pickImage() where the source can be set
    // to use camera or gallery. Here used camera so to let user click images.
    final pickedImage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: double.infinity, maxWidth: 600);

    if (pickedImage == null) {
      return;
    }

    // Using setState to help re-render the Widget when a new picture has to be
    // clicked and setting the file with the clicked image path to show the preview
    // on the screen.
    setState(() {
      _selectedImage = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget imageContent = TextButton.icon(
        label: const Text('Take Picture'),
        onPressed: _takePicture,
        icon: const Icon(Icons.camera));

    if (_selectedImage != null) {
      //GestureDetector is the widget which helps to check for different gestures on
      //the image which helps to retake the pictures that are already clicked.
      imageContent = GestureDetector(
          onTap: _takePicture,
          child: Image.file(
            _selectedImage!,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ));
    }
    return Container(
        height: 250,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2))),
        child: imageContent);
  }
}
