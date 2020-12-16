import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/models/address_model.dart';

class AddressCard extends StatelessWidget {
  final Address address;

  const AddressCard({Key key, this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey4,
        ),
        child: Column(
          children: [
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Address'),
                  Row(
                    children: [
                      Icon(CupertinoIcons.settings),
                      Icon(Icons.delete_outline)
                    ],
                  )
                ],
              ),
            ),
            Container(height: 0.5, width: double.infinity, color: CupertinoColors.inactiveGray,),
            Container(
              padding: EdgeInsets.fromLTRB(20,10,20,20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text('${address?.street}'),
                  Text('${address?.city} (${address?.state})'),
                  Text('${address?.postalCode}'),
                  Text('${address?.region}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}