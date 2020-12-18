import 'package:flutter_bootcamp_2020/global.dart';
import 'package:flutter_bootcamp_2020/models/article_model.dart';
import 'package:flutter_bootcamp_2020/services/remote_services.dart';
import 'package:get/get.dart';

class ArticleListController extends GetxController {
  final articleList = List<Article>().obs;
  final tailoringList = List<Article>().obs;
  final jewelryList = List<Article>().obs;
  final isLoading = false.obs;

  static ArticleListController get to => Get.find<ArticleListController>();

  @override
  void onInit() {
    super.onInit();
    _fetchArticles();
  }

  _fetchArticles() async{
    try {
      isLoading.value = true;
      var articles = await RemoteService.fetchArticles();
      if(articles != null)  {
        articleList.assignAll(articles);
        tailoringList.assignAll(articleList.where((article) => article.category == 'Tailoring'));
        jewelryList.assignAll(articleList.where((article) => article.category == 'Jewelry'));
      }
    } finally {
      isLoading.value = false;
    }
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