import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleCustomCard extends StatelessWidget {
  final articlePrice = '200';
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 150,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network('https://www.aisopos.it/wp-content/uploads/2020/03/Rossella-Cavioni-17-683x1024.jpeg',
              fit: BoxFit.cover,),
            ),

          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              alignment: Alignment.center,
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: Text(articlePrice, style: TextStyle(
                fontFamily: 'Arimo',
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic
              )
              ),
            ),
          )
        ]
      )
    );
  }
}
