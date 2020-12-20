import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_2020/controllers/address_delivery_controller.dart';
import 'package:flutter_bootcamp_2020/screens/edit_address.dart';
import 'package:flutter_bootcamp_2020/widgets/address_custom_card.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressDeliveryController>(
        builder: (controller) => Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10,0,10,10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('My addresses'),
                    FlatButton(
                      child: const Text('Add address'),
                      onPressed: () =>  Get.to(EditAddressPage(type: AddressPageType.add,))
                    )
                  ],
                ),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.addressList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AddressCard(address: controller.addressList[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}