import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/screens/article_list_screen.dart';
import '../global.dart';

class Market extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ArticleListScreen(list: list,);
  }
}