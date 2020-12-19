import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/controllers/article_list_controller.dart';
import 'package:flutter_bootcamp_2020/models/article_model.dart';
import 'package:flutter_bootcamp_2020/pictures.dart';
import 'package:flutter_bootcamp_2020/util/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../rounded_input.dart';

class UploadArticleScreen extends StatefulWidget {

  @override
  _UploadArticleScreenState createState() => _UploadArticleScreenState();
}

class _UploadArticleScreenState extends State<UploadArticleScreen> {
  String image;
  Article newArticle;

  @override
  void initState() {
    super.initState();
    newArticle = Article();
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
    //      builder: (context) => UploadImagesScreen(),
          builder: (context) => ImagePick(),
        ));

    if (result!=null) {
      setState(() {
        image = result;
        newArticle.imgUrl = result;
        //newArticle.imgUrl = imgFiles;
      });
    }
  }

Future<void> postArticle() async{
    var APIurl = "https://api.flutterbootcamp.com/article";
    var json = convert.jsonEncode(newArticle);
    print(json);
    var response =await http.post(APIurl, body: json);
    print("response.statusCode${response.statusCode}");
    print(response.body);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CupertinoColors.systemGrey5,
      appBar: AppBar(title: Text('SoItaly')),
      body: Padding(
        padding: const EdgeInsets.only(bottom:40.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              uploadImagesCard(),
              setArticleFieldCard(),
              FlatButton(
                color: Colors.black,
                child: Text(
                  'Carica articolo',
                  style: TextStyle(fontSize: 16, color: Colors.white ),
                ),
                onPressed: () {
                  postArticle();
                  ArticleListController.to.addArticle(newArticle);
                  Navigator.pop(context);
                },
              ),

            ],
          ),
        ),
      ),
    );
  }



  Card setArticleFieldCard(){
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Wrap(
          runSpacing: 5,
          children: [
            Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text('2', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Inserisci i campi dell\'articolo',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                )
              ],
            ),
            RoundedInput(
              hintText: "Article Name",
              onChanged: (value) {
                newArticle.name = value;
              },
            ),
            GestureDetector(
              onTap: (){
                int support;
                return showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      support = 0;
                      return picker(
                          CupertinoPicker(
                              itemExtent: 30,
                              onSelectedItemChanged: (int index) {
                                support = index;
                              },
                              children: Constants.CATEGORIES.map((category) => Text(category)).toList()
                      ),
                          TopBarOfBottomSheet(
                                () {
                                  switch (support) {
                                    case 0:
                                      setState(() {
                                        newArticle.category = 'Tailoring';
                                      });
                                      break;
                                    default:
                                      setState(() {
                                        newArticle.category = 'Jewelry';
                                      });
                                  }
                                  print(newArticle.category);
                                  Navigator.pop(context);

                                },
                                () {
                              Navigator.pop(context);
                              print(newArticle.category);
                            },
                          ));
                    });
              },
              child: Container(
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all()
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: Text(
                    newArticle.category==null? 'Seleziona la categoria' : newArticle.category,
                    style: TextStyle(
                        color: newArticle.category==null? Colors.grey : Colors.black,
                        fontSize: 16
                    ),
                    textAlign: TextAlign.center, ),
                ),
              ),
            ),
            RoundedInput(
              hintText: "Article prezzo",
              onChanged: (value) {
                newArticle.price = num.parse(value);
              },
            ),
            RoundedInput(
              hintText: "Article descrizione",
              onChanged: (value) {
                newArticle.description = value;
              },
            ),
          ],
        ),
      ),
    );
  }

  Card uploadImagesCard(){
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text('1', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Carica una o più immagini dell\'articolo',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                )
              ],
            ),

            Padding(
                padding: const EdgeInsets.fromLTRB(30,20,30,20),
                child: image!=null ? Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      color: Colors.black.withOpacity(0.8),
                      height: 406,
                      child: Column(
                        children: [
                          Container(
                              height: 300,
                              child: Image.network(image, fit: BoxFit.fitHeight,)),
                        ],
                      ),
                    ),

                  ],
                )
                    : Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 0.5),

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Carica un\'immagine',
                          style: TextStyle(fontSize: 18),),
                      ),
                      Icon(Icons.photo_camera_outlined, size: 80,)
                    ],
                  ),
                )
            ),

            FlatButton(
              color: Colors.black,
              child: Text(
                'Scegli le immagini',
                style: TextStyle(fontSize: 16, color: Colors.white ),
              ),
              onPressed: () {
                _awaitReturnValueFromSecondScreen(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TopBarOfBottomSheet extends StatelessWidget {
  final Function back;
  final Function confirm;

  TopBarOfBottomSheet(this.confirm, [this.back]);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: CupertinoColors.systemGrey6),
      child: Stack(
        children: [
          Positioned(
            top: 12.5,
            right: 10,
            child: Container(
              alignment: Alignment.center,
              width: 85,
              child: InkWell(
                onTap: () {
                  confirm();
                },
                child: Text(
                  "Confirm",
                  style: TextStyle(
                      color: CupertinoColors.activeBlue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
            top: 12.5,
            left: 7,
            child: Container(
              alignment: Alignment.center,
              width: 80,
              child: InkWell(
                onTap: () {
                  if (back() != null) {
                    back();
                  }
                },
                child: Text(
                  "Annulla",
                  style: TextStyle(
                      color: CupertinoColors.activeBlue, fontSize: 15),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OakPicker extends StatelessWidget {
  final Function confirm;
  final Function back;
  final Widget picker;

  OakPicker(this.confirm, this.back, this.picker);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TopBarOfBottomSheet(confirm(), back()),
        Container(
          padding: EdgeInsets.only(top: 30),
          color: Color.fromRGBO(208, 211, 218, 1),
          height: 210,
          child: Container(
            padding: EdgeInsets.only(top: 10),
            height: 190,
            child: picker,
          ),
        ),
      ],
    );
  }
}

Widget picker(Widget child, TopBarOfBottomSheet topBar) {
  return Stack(
    children: [
      Container(
        padding: EdgeInsets.only(top: 30),
        color: Color.fromRGBO(208, 211, 218, 1),
        height: 210,
        child: Container(
          padding: EdgeInsets.only(top: 10),
          height: 190,
          child: child
        ),
      ),
      topBar,
    ],
  );
}