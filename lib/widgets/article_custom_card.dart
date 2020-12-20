import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/models/article_model.dart';
import 'package:flutter_bootcamp_2020/screens/article_screen.dart';

class ArticleCustomCard extends StatelessWidget {
  final Article article;

  const ArticleCustomCard({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return article.imgUrl==null? const SizedBox() : GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context)=> ArticleScreen(article: article,))
        );
      },
      child: Card(
        elevation: 3,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 150,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(article.imgUrl,
                fit: BoxFit.cover),
              ),

            ),
            Positioned(
              bottom: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                alignment: Alignment.center,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.price.toString(), style: const TextStyle(color: Colors.white)),
                    Text(article.description, overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white),)
                  ]
                )
              )
            )
          ]
        )
      )
    );
  }
}