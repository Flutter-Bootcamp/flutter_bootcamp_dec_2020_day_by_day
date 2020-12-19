import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/models/article_model.dart';
import 'package:flutter_bootcamp_2020/util/constants.dart';
import 'package:flutter_bootcamp_2020/widgets/article_custom_tile.dart';

class ArticleListScreen extends StatefulWidget {
  final List<Article> list;

  const ArticleListScreen({Key key, this.list}) : super(key: key);

  @override
  _ArticleListScreenState createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {

  List<Article> stateList;
  String orderByFilter;

  @override
  void initState() {
    super.initState();
    _initializeList();
    orderByFilter = 'No filter';
  }

  _initializeList(){
    setState(() {
      stateList = List.from(widget.list);
    });
  }

  _sortList(bool reserve){
    setState(() {
      stateList.sort((a, b){
        return reserve? b.compareTo(a) : a.compareTo(b);
      });
    });
  }

  _orderBy(String choice) {
    setState(() {
      orderByFilter = choice;
    });
    switch(choice){
      case('No filter'):
        _initializeList();
        break;
      case('From most expensive'):
        _sortList(false);
        break;
      default:
        _sortList(true);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGrey4,
      appBar: AppBar(title: const Text('Flutter Bootcamp 2020')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all()
            ),
            child: PopupMenuButton<String>(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text( orderByFilter=='No filter'
                      ? 'Order by'
                      : orderByFilter
                  ),
                  const SizedBox(width: 5,),
                  const Icon(Icons.arrow_drop_down_circle)
                ],
              ),
              onSelected: _orderBy,
              itemBuilder: (BuildContext context) {
                return Constants.orderBy.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: stateList.length,
              itemBuilder: (BuildContext context, int index){
                return ArticleCustomTile(article: stateList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
