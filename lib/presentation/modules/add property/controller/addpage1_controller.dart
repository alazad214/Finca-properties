import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class Addpage1Controller extends GetxController {
  final typeController = SingleValueDropDownController();
  final statusController = SingleValueDropDownController();
  final bedroomController = SingleValueDropDownController();
  final bathroomController = SingleValueDropDownController();
  final belconisController = SingleValueDropDownController();
  final garagesController = SingleValueDropDownController();
  final addressController = TextEditingController();
  final propertyNameController = TextEditingController();
  final priceController = TextEditingController();
  final sizesftController = TextEditingController();
  final utilitytController = TextEditingController();
  final RxBool propertyvalue = false.obs;

  void updatePropertyType(String type) {
    propertyvalue.value = [
      'Apartment/Flats',
      'Independent House',
      'Duplex/Home',
    ].contains(type);
  }
}
