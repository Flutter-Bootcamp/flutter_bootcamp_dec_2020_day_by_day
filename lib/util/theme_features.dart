import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeFeatures {
  static const TextStyle bold = const TextStyle(
    fontFamily: 'Arimo',
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
    wordSpacing: -0.5,
    fontSize: 16
  );
  static const TextStyle boldWhite = const TextStyle(
      fontFamily: 'Arimo',
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5,
      wordSpacing: -0.5,
      fontSize: 16,
      color: Colors.white
  );

  static const TextStyle normal = const TextStyle(
    fontFamily: 'Arimo',
  );

  static const TextStyle normalWhite = const TextStyle(
    fontFamily: 'Arimo',
    color: Colors.white
  );

  static const TextStyle italic = const TextStyle(
    fontFamily: 'Arimo',
    fontStyle: FontStyle.italic
  );

}