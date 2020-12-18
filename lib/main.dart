import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/screens/homepage_screen.dart';
import 'package:flutter_bootcamp_2020/util/theme_features.dart';
import 'package:get/get.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Bootcamp 2020',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 10,
          textTheme: TextTheme(
            headline6: ThemeFeatures.boldWhite
          )
        )
      ),
      home: HomePage(),
    );
  }
}

