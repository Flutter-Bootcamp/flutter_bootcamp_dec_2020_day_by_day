import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/controllers/address_delivery_controller.dart';
import 'package:flutter_bootcamp_2020/controllers/cart_controller.dart';
import 'package:flutter_bootcamp_2020/screens/profile_screen.dart';
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
    return Scaffold(
      backgroundColor: CupertinoColors.systemGrey5,
      appBar: AppBar(title: const Text('Flutter Bootcamp 2020')),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: Obx(
          ()=>BottomNavigationBar(
            elevation: 5,
            fixedColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: cartController.cartList.isEmpty
                      ? Icon(CupertinoIcons.shopping_cart)
                  : Stack(
                    children: [
                      Icon(CupertinoIcons.cart_fill),
                      Container(
                        alignment: Alignment.center,
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle
                        ),
                        child: Text(cartController.cartList.length.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  label: 'Cart'
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.profile_circled),
                  label: 'Profile'
              )
            ],
            currentIndex: _selectedIndex,
            selectedFontSize: 13,
            unselectedFontSize: 13,
            onTap: _onItemTap,
          )
      ),
    );
  }
}