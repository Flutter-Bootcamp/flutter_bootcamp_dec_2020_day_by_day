import 'package:flutter_bootcamp_2020/models/article_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final cartList = [].obs;
  final cartAmount = 0.0.obs;

  static CartController get to => Get.find<CartController>();

  addArticleToCart(Article article){
    if(cartList.indexOf(article) == -1){
      cartList.add(article);
      cartAmount(cartAmount.value + article.price);
    }
  }

  deleteArticleFromCart (Article article) {
    cartList.remove(article);
    cartAmount(cartAmount.value - article.price);
  }

  emptyCart(){
    cartList(List.from([]));
    cartAmount(0.0);
  }
}