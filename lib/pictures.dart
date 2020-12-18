import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ImagePick extends StatefulWidget {
  @override
  ImagePickState createState() => ImagePickState();
  var _image;
  var url;
}

class ImagePickState extends State<ImagePick> {
  final Future<FirebaseApp> _inizialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _inizialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text(snapshot.error);
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(body: articleData());
          }
          return Text("Something bad happened...");
        });
    // return articleData();
  }

  Widget articleData() {
    return Column(
      children: [
        SizedBox(
            height: 300,
            width: double.infinity,
            child: Center(
              child: widget._image == null
                  ? Text("no image selected")
                  : Image.file(widget._image, fit: BoxFit.cover),
            )),
        RaisedButton(
          color: Colors.blue,
          child: Text("add image"),
          onPressed: getImage,
        ),
        RaisedButton(
          color: widget._image == null
              ? CupertinoColors.inactiveGray
              : Colors.blue,
          child: Text("Upload Article"),
          onPressed:()=> Navigator.pop(context,widget.url),
        )
      ],
    );
  }

  Future<void> getImage() async {
    var pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    final File file = File(pickedFile.path);
    await uploadOnFirebaseAndGetLink(file);
    setState(() {
      if (pickedFile != null) {
        widget._image = file;
      } else {
        print("No image selected");
      }
    });
  }

  Future<void> uploadOnFirebaseAndGetLink(File image) async {
    String filename = DateTime.now().toString();
    var storage = await firebase_storage.FirebaseStorage.instance;

    var uploadData = await firebase_storage.FirebaseStorage.instance
        .ref()
        .child("BootcampImage/" + filename)
        .putFile(image);
    print(uploadData.runtimeType);

    String url = await firebase_storage.FirebaseStorage.instance
        .ref()
        .child("BootcampImage/" + filename)
        .getDownloadURL();
    widget.url = url;
    print("the link is: $url");
  }
}
/*
class articleCreationPage extends StatefulWidget {
  @override
  articleCreationPageState createState() => articleCreationPageState();
}

class articleCreationPageState extends State<articleCreationPage> {
  String name;
  int price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 600,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              showForm(),
              imagePick(),
            ],
          ),
        ),
      ),
    );
  }

  Widget showForm() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          articleName(),
          articlePrice(),
        ]);
  }

  Widget articleName() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(70, 70, 70, 0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        decoration: new InputDecoration(labelText: "Item name"),
        onSaved: (value) => name = value.trim(),
      ),
    );
  }

  Widget articlePrice() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(70, 30, 70, 0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(labelText: "Item name"),
        onSaved: (value) => price = value as int,
      ),
    );
  }
}*/