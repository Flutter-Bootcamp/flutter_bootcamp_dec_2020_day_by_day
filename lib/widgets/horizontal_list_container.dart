import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/global.dart';
import 'package:flutter_bootcamp_2020/models/article_model.dart';
import 'package:flutter_bootcamp_2020/screens/article_list_screen.dart';
import 'package:flutter_bootcamp_2020/widgets/article_custom_card.dart';
import 'package:get/get.dart';

class HorizontalListContainer extends StatefulWidget {
  final String category;

  const HorizontalListContainer({Key key, this.category}) : super(key: key);

  @override
  _HorizontalListContainerState createState() => _HorizontalListContainerState();
}

class _HorizontalListContainerState extends State<HorizontalListContainer> {
  List<Article> articleList;

 /* @override
  void initState() {
    super.initState();
    switch(widget.category) {
      case('Tailoring'):
    }
  } */

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ArticleListScreen(list: list,)));
        Get.to(ArticleListScreen());
        },
      child: Card(
        child: Container(
          height: 320,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(widget.category),
                  Icon(Icons.arrow_right_outlined)
                ],
              ),
              Container(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ArticleCustomCard(article: list[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
