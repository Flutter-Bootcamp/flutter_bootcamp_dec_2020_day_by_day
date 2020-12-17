import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/models/article_model.dart';
import 'package:flutter_bootcamp_2020/screens/article_screen.dart';

class ArticleCustomCard extends StatelessWidget {
  final Article article;

  const ArticleCustomCard({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                fit: BoxFit.cover,),
              ),

            ),
            Positioned(
              bottom: 10,
              child: Container(
                alignment: Alignment.center,
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                ),
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  children: [
                    Text(article.price.toString(), style: TextStyle(color: Colors.white)),
                    Text(article.description, overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            )
          ]
        )
      ),
    );
  }
}
