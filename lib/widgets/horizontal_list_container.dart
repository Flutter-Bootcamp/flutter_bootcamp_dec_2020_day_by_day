import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/controllers/article_list_controller.dart';
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
  final controller = ArticleListController.to;

  @override
  void initState() {
    super.initState();
    switch(widget.category) {
      case('Tailoring'):
        articleList = controller.tailoringList;
        break;
      case('Jewelry'):
        articleList = controller.jewelryList;
        break;
      default:
        articleList = controller.articleList;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=>GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ArticleListScreen(list: articleList,)));
            //Get.to(ArticleListScreen());
          },
          child: Card(
            child: Container(
              height: articleList.isEmpty? 0 : 320,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(widget.category),
                      const Icon(Icons.arrow_right_outlined)
                    ],
                  ),
                  Container(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: articleList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ArticleCustomCard(article: articleList[index]);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
