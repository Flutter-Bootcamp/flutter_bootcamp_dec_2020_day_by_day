import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/controllers/address_delivery_controller.dart';
import 'package:flutter_bootcamp_2020/models/address_model.dart';
import 'package:flutter_bootcamp_2020/screens/edit_address.dart';

class AddressCard extends StatelessWidget {
  final Address address;

  const AddressCard({Key key, this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey4,
      ),
      child: Column(
        children: [
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Address'),
                Row(
                  children: [
                     GestureDetector(
                         child: const Icon(CupertinoIcons.settings),
                       onTap: ()=>Navigator.of(context).push(
                           MaterialPageRoute(
                               builder: (BuildContext context)=> EditAddressPage(
                                 address: address,
                                 type: AddressPageType.edit,
                               ))),
                     ),
                    if(AddressDeliveryController.to.addressList.length>1)
                    GestureDetector(
                        onTap: ()=> AddressDeliveryController.to.deleteAddress(address),
                        child: const Icon(Icons.delete_outline)
                    )
                  ],
                )
              ],
            ),
          ),
          Container(height: 0.5, width: double.infinity, color: CupertinoColors.inactiveGray,),
          Container(
            padding: const EdgeInsets.fromLTRB(20,10,20,20),
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
    );
  }
}