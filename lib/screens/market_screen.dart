import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/screens/article_list_screen.dart';
import 'package:flutter_bootcamp_2020/screens/article_screen.dart';
import 'package:flutter_bootcamp_2020/widgets/article_custom_tile.dart';

import '../global.dart';

class Market extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ArticleScreen(article: list[0]),
    );
  }
}