import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/widgets/empty_cart_card.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        height: 200,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Cart\'s amount: '),
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)
              ),
              child: FlatButton(
                child: Text('Buy all', style: TextStyle(color: Colors.white),),
                onPressed: (){},
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
                onPressed:(){},
              ),
            )
          ],
        ),
      ),
    );
  }
}