import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart';

import '../global.dart';

class imagePick extends StatefulWidget {
  @override
  imagePick_State createState() => imagePick_State();
}

class imagePick_State extends State<imagePick> {
  File _image;
  firebase_storage.FirebaseStorage storage;

  @override
  void initState() {
    storage = firebase_storage.FirebaseStorage.instance;

    super.initState();
  }

  Future getImage({ImageSource source}) async {
    var pickedFile = await ImagePicker().getImage(source: source);
    final File file = File(pickedFile.path);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });

    await upload(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Column(children: [
        Center(
          child:
              _image == null ? Text('No image selected.') : Image.file(_image),
        ),
        custom_buttons(),
        MaterialButton(
            color: Colors.blue,
            child: Text("UPLOAD"),
            onPressed: () => Navigator.pop(context)),
      ]),
    );
  }

  Widget custom_buttons() {
    return Row(
      children: [
        MaterialButton(
          onPressed: () {
            getImage(source: ImageSource.camera);
          },
          child: Icon(Icons.add_a_photo),
        ),
        MaterialButton(
          onPressed: () {
            getImage(source: ImageSource.gallery);
          },
          child: Icon(Icons.photo_size_select_actual_outlined),
        ),
      ],
    );
  }

  Future<void> upload(File image) async {
    print("Starting upload...");
    String filename = DateTime.now().toString();
    var uploadData = await firebase_storage.FirebaseStorage.instance
        .ref()
        .child("image/" + filename)
        .putFile(image);
    print("uploadData: $uploadData");
    print(uploadData.runtimeType);

    String url = await firebase_storage.FirebaseStorage.instance
        .ref()
        .child("image/" + filename)
        .getDownloadURL();

    imgLink = url;

    print(imgLink);

    print("finished upload...");
    return true;
  }
}
