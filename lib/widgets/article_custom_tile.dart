import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/models/article_model.dart';
import 'package:flutter_bootcamp_2020/screens/article_screen.dart';

enum TileType {list, cart}

class ArticleCustomTile extends StatelessWidget {
  final Article article;
  final TileType tileType;

  const ArticleCustomTile({Key key, this.article, this.tileType}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ArticleScreen(article: article,)
        ));
      },
      child: Container(
        height: 185,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              bodyTile(context),
              if(tileType == TileType.list)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delete from cart'),
                    Text('${article.price}')
                  ],
                )
            ]
          )
        )
      ),
    );
  }

  bodyTile(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(article.imgUrl)
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
    );
  }
}
