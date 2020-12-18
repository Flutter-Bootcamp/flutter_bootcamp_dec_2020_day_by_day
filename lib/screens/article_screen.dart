import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/controllers/article_list_controller.dart';
import 'package:flutter_bootcamp_2020/controllers/cart_controller.dart';
import 'package:flutter_bootcamp_2020/models/article_model.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;
  final ArticleListController controller = ArticleListController.to;

  ArticleScreen({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGrey5,
      appBar: AppBar(title: const Text('Flutter Bootcamp 2020')),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.network(article.imgUrl),
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey4
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(article.name),
                  Text(article.category),
                  Text(article.price.toString()),
                  Text(article.description),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 40,
                    child: FlatButton(
                      color: Colors.black,
                      child: const Text('Add to cart', style: TextStyle(color: Colors.white),),
                      onPressed: (){
                        CartController.to.addArticleToCart(article);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all()
                    ),
                    child: FlatButton(
                      child: const Text('Buy now'),
                      onPressed: (){
                        controller.deleteArticle(article);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
