import 'package:get/get.dart';

import '../utils/dhaka_city_utils.dart';

class PopulerCitySearchController extends GetxController {
  var foundItem = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    foundItem.value = populerCity;
    super.onInit();
  }

  void runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      foundItem.value = populerCity;
    } else {
      foundItem.value = populerCity
          .where((user) => user["city"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
  }
}
