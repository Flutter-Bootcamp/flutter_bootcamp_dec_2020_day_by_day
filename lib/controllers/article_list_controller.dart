import 'package:flutter_bootcamp_2020/global.dart';
import 'package:flutter_bootcamp_2020/models/article_model.dart';
import 'package:get/get.dart';

class ArticleListController extends GetxController {
  final articleList = List<Article>().obs;
  final tailoringList = List<Article>().obs;
  final jewelryList = List<Article>().obs;

  static ArticleListController get to => Get.find<ArticleListController>();

  @override
  void onInit() {
    super.onInit();
    articleList.assignAll(list);
    tailoringList.assignAll(articleList.where((article) => article.category == 'Tailoring'));
    jewelryList.assignAll(articleList.where((article) => article.category == 'Jewelry'));
  }

  deleteArticle(Article article) {
    articleList.remove(article);
    if(tailoringList.indexOf(article) != -1) {
      tailoringList.remove(article);
    }
    if(jewelryList.indexOf(article) != -1) {
      jewelryList.remove(article);
    }
  }

  addArticle(Article article){
    switch(article.category){
      case('Tailoring'):
        tailoringList.add(article);
        articleList.add(article);
        break;
      case('Jewelry'):
        jewelryList.add(article);
        articleList.add(article);
        break;
      default:
        articleList.add(article);
        break;

    }
  }
}