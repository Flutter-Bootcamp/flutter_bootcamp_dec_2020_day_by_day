import 'package:flutter_bootcamp_2020/models/address_model.dart';
import 'package:get/get.dart';

class AddressDeliveryController extends GetxController {
  List<Address> addressList = [Address.uno(), Address.due()];

  static AddressDeliveryController get to => Get.find<AddressDeliveryController>();

  setAddress(Address newAddress, Address oldAddress){
    addressList.remove(oldAddress);
    addressList.add(newAddress);
    update();
  }

  addAddress(Address address){
    addressList.add(address);
    update();
  }

  deleteAddress(Address address){
    addressList.remove(address);
    update();
  }
}