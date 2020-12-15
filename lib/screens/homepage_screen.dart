import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/screens/profile.dart';
import 'package:flutter_bootcamp_2020/widgets/article_custom_card.dart';

import 'cart_screen.dart';
import 'market_screen.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex;
  List<Widget> _pages;

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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        fixedColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart'
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile'
          )
        ],
        currentIndex: 0,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        onTap: _onItemTap,
      ),
    );
  }
}