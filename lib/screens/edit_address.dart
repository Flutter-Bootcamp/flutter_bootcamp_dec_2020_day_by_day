import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/controllers/address_delivery_controller.dart';
import 'package:flutter_bootcamp_2020/models/address_model.dart';
import 'package:flutter_bootcamp_2020/rounded_input.dart';

enum AddressPageType {add, edit}

class EditAddressPage extends StatelessWidget {
  final AddressPageType type;
  final Address address;
  final AddressDeliveryController ctrl = AddressDeliveryController.to;

  EditAddressPage({Key key, this.type, this.address}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Address newAddress = type==AddressPageType.add? new Address() : Address.fromAddress(address);
    return Scaffold(
      appBar: AppBar(title: Text(
        type == AddressPageType.add
            ? 'Add new address'
            : 'Edit address'
      ),),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          RoundedInput(
            key: ObjectKey('Street'),
            hintText: 'Street',
            onChanged: (value){
              newAddress?.street = value;
            },
            initialValue: newAddress?.street ?? '',
          ),
          RoundedInput(
            key: ObjectKey('City'),
            hintText: 'City',
            onChanged: (value){
              newAddress?.city = value;
            },
            initialValue: newAddress?.city ?? '',
          ),
          RoundedInput(
            key: ObjectKey('Region'),

            hintText: 'Region',
            onChanged: (value){
              newAddress?.region = value;
            },
            initialValue: newAddress?.region ?? '',
          ),
          RoundedInput(
            key: ObjectKey('State'),
            hintText: 'State',
            onChanged: (value){
              newAddress?.state = value;
            },
            initialValue: newAddress?.state ?? '',
          ),
          RoundedInput(
            key: ObjectKey('Postal Code'),

            hintText: 'Postal Code',
            onChanged: (value){
              newAddress?.postalCode = value;
            },
            initialValue: newAddress?.postalCode ?? '',
          ),
          FlatButton(
            color: Colors.black,
            child: Text(
              type == AddressPageType.edit
                  ?  'Save changes'
                  : 'Create address',
              style: TextStyle(color: Colors.white)
            ),
            onPressed: (){
              if(type == AddressPageType.edit){
                ctrl.setAddress(newAddress, address);
              } else {
                ctrl.addAddress(newAddress);
              }
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
