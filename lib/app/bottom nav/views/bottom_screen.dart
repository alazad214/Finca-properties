import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../controller/bottom_controller.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});
  final BottomNavController bottomNavController =
      Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() =>
          bottomNavController.pages[bottomNavController.selectedIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: bottomNavController.selectedIndex.value,
            elevation: 50,
            iconSize: 30.0,
            selectedItemColor: Colors.blueAccent,
            unselectedIconTheme: const IconThemeData(color: Colors.black54),
            unselectedItemColor: Colors.black54,
            showUnselectedLabels: true,
            onTap: (index) {
              bottomNavController.changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Iconsax.home),
                activeIcon: Icon(Iconsax.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.book),
                label: 'Blog',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.heart),
                label: 'Faviorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          )),
    );
  }
}
