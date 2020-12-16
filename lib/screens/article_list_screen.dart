import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/models/article_model.dart';
import 'package:flutter_bootcamp_2020/widgets/article_custom_tile.dart';

class ArticleListScreen extends StatelessWidget {
  final List<Article> list;

  const ArticleListScreen({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Bootcamp 2020')),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index){
          return ArticleCustomTile(article: list[index]);
        },
      ),
    );
  }
}
