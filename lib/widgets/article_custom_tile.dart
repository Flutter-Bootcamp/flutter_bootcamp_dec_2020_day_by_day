import 'package:flutter/material.dart';

class ArticleCustomTile extends StatelessWidget {
  final String articleName;
  final String articlePrice;
  final String articleDescrition;
  final String articleCategory;
  final String articleBrandName;

  const ArticleCustomTile({Key key, this.articleName, this.articlePrice, this.articleDescrition, this.articleCategory, this.articleBrandName}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: $articleName'),
              Text('Category: $articleCategory'),
              Text('Brand name: $articleBrandName'),
              Text('Price: $articlePrice'),
              Text('Description: $articleDescrition'),
            ],
          )
        ],
      ),
    );
  }
}
