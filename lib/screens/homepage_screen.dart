import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/controllers/address_delivery_controller.dart';
import 'package:flutter_bootcamp_2020/controllers/article_list_controller.dart';
import 'package:flutter_bootcamp_2020/controllers/cart_controller.dart';
import 'package:flutter_bootcamp_2020/screens/profile_screen.dart';
import 'package:flutter_bootcamp_2020/screens/upload_article_screen.dart';
import 'package:get/get.dart';
import 'cart_screen.dart';
import 'market_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex;
  List<Widget> _pages;
  final addressController = Get.put(AddressDeliveryController());
  final cartController = Get.put(CartController());
  final articleListController = Get.put(ArticleListController());

  @override
  void initState(){
    super.initState();
    _selectedIndex = 0;
    _pages = [
      Market(),
      Cart(),
      Profile()
    ];
  }

  _onItemTap(value){
    setState(() {
      _selectedIndex = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      backgroundColor: CupertinoColors.systemGrey5,
      appBar: AppBar(title: const Text('Flutter Bootcamp 2020')),
      body: articleListController.isLoading.value
          ? const Center(
          child: const CircularProgressIndicator()
      )
          :_pages.elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(CupertinoIcons.plus),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context)=>UploadArticleScreen()
          ));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        fixedColor: Colors.black,
        items: [
          const BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: cartController.cartList.isEmpty
                  ? const Icon(CupertinoIcons.shopping_cart)
                  : Stack(
                children: [
                  const Icon(CupertinoIcons.cart_fill),
                  Container(
                    alignment: Alignment.center,
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle
                    ),
                    child: Text(cartController.cartList.length.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
              label: 'Cart'
          ),
          const BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.profile_circled),
              label: 'Profile'
          )
        ],
        currentIndex: _selectedIndex,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        onTap: _onItemTap,
      ),
    ));
  }
}