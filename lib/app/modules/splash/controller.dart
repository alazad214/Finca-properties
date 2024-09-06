import 'dart:async';
import 'package:get/get.dart';

import '../../bottom nav/views/bottom_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () {
      Get.offNamed('/home_screen');
      Get.offAll(() => BottomNavScreen());
    });
  }
}
