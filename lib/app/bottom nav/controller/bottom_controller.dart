import 'package:get/get.dart';
import 'package:universe_it_project/app/modules/booking%20now/views/booking_screen.dart';
import '../../modules/blogs/views/blog_item.dart';
import '../../modules/home/home.dart';
import '../../modules/profile/views/profile_screen.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  final pages = [Home(), BlogItem(), BookingScreen(), Profile_Screen()];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
