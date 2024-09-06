import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final tokenStorage = FlutterSecureStorage();

  RxString phone = RxString('01763551316');
  RxString email = RxString('alazad214@gmail.com');
  RxString name = RxString('Al Azad');
  RxString monthly_income = RxString('4521');
  RxString permanent_addreess = RxString('Baliadangi');
  RxString present_address = RxString('Dhaka');
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController monthly_incomeController;
  late TextEditingController permanent_addreessController;
  late TextEditingController present_addressController;

  @override
  void onInit() {
    phoneController = TextEditingController(text: phone.value);
    emailController = TextEditingController(text: email.value);
    nameController = TextEditingController(text: name.value);
    monthly_incomeController =
        TextEditingController(text: monthly_income.value);
    permanent_addreessController =
        TextEditingController(text: permanent_addreess.value);
    present_addressController =
        TextEditingController(text: present_address.value);

    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    phoneController.dispose();
    nameController.dispose();
    monthly_incomeController.dispose();
    permanent_addreessController.dispose();
    present_addressController.dispose();
    super.onClose();
  }
}
