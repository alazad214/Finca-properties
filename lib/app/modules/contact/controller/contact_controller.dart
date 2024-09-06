import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();
  RxString name = RxString('');
  RxString email = RxString('');
  RxString subject = RxString('');
  RxString phone = RxString('');
  RxString message = RxString('');
}
