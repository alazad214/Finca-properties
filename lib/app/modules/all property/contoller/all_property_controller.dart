import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AllPropertyController extends GetxController {
  ///Images Controller
  var imageList = [
    'assets/images/flat4.jpg',
    'assets/images/flat.jpg',
    'assets/images/flat4.jpg',
  ].obs;

  ///Make a Caller Function
  void makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      Fluttertoast.showToast(msg: 'Something Wrong');
    }
  }
}
