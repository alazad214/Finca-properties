import 'package:get/get.dart';

import '../controller/signin _controller.dart';

class Signinbindingis implements Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
  }
}
