import 'package:get/get.dart';

class AddController extends GetxController {
  var type = ''.obs;
  var status = ''.obs;
  var addressName = ''.obs;
  var propertyName = ''.obs;
  var size = ''.obs;
  var utilityCost = ''.obs;
  var totalPrice = ''.obs;
  var Bedroom = ''.obs;
  var Bathroom = ''.obs;
  var Belconis = ''.obs;
  var garages = ''.obs;
  var floorNumber = ''.obs;
  var title = ''.obs;
  var Description = ''.obs;
  var mobile = ''.obs;
  var priceIs = ''.obs;
  void setSelectedOption(String value) {
    priceIs.value = value;
  }
}
