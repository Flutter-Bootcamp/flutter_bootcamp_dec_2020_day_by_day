import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/screens/article_list_screen.dart';
import 'package:flutter_bootcamp_2020/util/constants.dart';
import 'package:flutter_bootcamp_2020/widgets/horizontal_list_container.dart';
import '../global.dart';

class Market extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for(var category in Constants.CATEGORIES)
        HorizontalListContainer(category: category),
      ],
    );
  }
}