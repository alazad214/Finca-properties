import 'package:get/get.dart';

class AmenitiesController extends GetxController {
  var amenities = {
    "Mosques/Prayer Place": false,
    "Park": false,
    "Lift": false,
    "Cylinder": false,
    "Parking": false,
    "Hot Water connection": false,
    "Fire Exit": false,
  }.obs;

  var selectAll = false.obs;

  void toggleAmenity(String key, bool value) {
    amenities[key] = value;
    checkSelectAllStatus();
  }

  void toggleSelectAll(bool value) {
    selectAll.value = value;
    amenities.updateAll((key, value) => selectAll.value);
  }

  void checkSelectAllStatus() {
    selectAll.value = amenities.values.every((item) => item);
  }
}
