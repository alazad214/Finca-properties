import 'package:get/get.dart';

import '../../modules/blogs/views/blog_item.dart';
import '../../modules/favourite/view/faviorite_screen.dart';
import '../../modules/home/home.dart';
import '../../modules/profile/views/profile_screen.dart';


class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  final pages = [Home(), BlogItem(), FavoriteScreen(), Profile_Screen ()];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
