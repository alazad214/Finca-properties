import 'package:get/get.dart';

import '../utils/property_data.dart';

class AllSearchController extends GetxController {
  var foundItem = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    foundItem.value = propertyData;
    super.onInit();
  }

  void runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      foundItem.value = propertyData;
    } else {
      foundItem.value = propertyData
          .where((user) => user["location"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
  }
}
