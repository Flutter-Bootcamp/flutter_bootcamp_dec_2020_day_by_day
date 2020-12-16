import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/models/article_model.dart';

class ArticleCustomTile extends StatelessWidget {
  final Article article;

  const ArticleCustomTile({Key key, this.article}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 180,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage('https://www.aisopos.it/wp-content/uploads/2020/03/Rossella-Cavioni-17-683x1024.jpeg')
              )
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width/2.1,
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${article.name}'),
                Text('Category: ${article.category}'),
                Text('Brand name: ${article.brandName}'),
                Text('Price: ${article.price}'),
                Text('Description: ${article.description}'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
