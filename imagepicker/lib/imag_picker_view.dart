import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  XFile? image; //this is the state variable
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CodewithHussain'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  final ImagePicker _picker = ImagePicker();
                  final img =
                      await _picker.pickImage(source: ImageSource.gallery);
                  // print("object");
                  setState(() {
                    image = img;
                  });
                },
                label: const Text('Choose Image'),
                icon: const Icon(Icons.image),
              ),
              ElevatedButton.icon(
                onPressed: () async {},
                label: const Text('Take Photo'),
                icon: const Icon(Icons.camera_alt_outlined),
              ),
            ],
          ),
          //check the image state and
          //update the UI
          if (image != null)
            Expanded(
              child: Column(
                children: [
                  //This will show image on to the screen
                  Expanded(child: Image.file(File(image!.path))),

                  //This will remove image from the UI
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text('Remove Image'),
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
