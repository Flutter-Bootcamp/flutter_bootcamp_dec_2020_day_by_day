import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/controllers/article_list_controller.dart';
import 'package:flutter_bootcamp_2020/controllers/cart_controller.dart';
import 'package:flutter_bootcamp_2020/widgets/article_custom_tile.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  final CartController cartCtrl = CartController.to;

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Column(
      children: [
        Card(
          child: Container(
            padding: EdgeInsets.all(20),
            height: 200,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Cart\'s amount: ${cartCtrl.cartAmount.value}'),
                Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: FlatButton(
                    child: Text('Buy all', style: TextStyle(color: Colors.white),),
                    onPressed: (){
                      /*cartCtrl.cartList.forEach((article) {
                        ArticleListController.to.deleteArticle(article);
                        cartCtrl.deleteArticleFromCart(article);
                      });*/
                    },
                  ),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()
                  ),
                  child: FlatButton(
                    child: Text('Empty Cart'),
                    onPressed:(){
                      cartCtrl.emptyCart();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Flexible(
          child: ListView.builder(
            itemCount: cartCtrl.cartList.length,
            itemBuilder: (BuildContext context, int index){
              return ArticleCustomTile(
                article: cartCtrl.cartList[index],
                tileType: TileType.cart,
              );
            },
          ),
        )
      ],
    ));
  }
}