import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  static const String themeKey = "isDarkMode";
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTheme();
  }

  void loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool(themeKey) ?? false;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void toggleTheme() async {
    isDarkMode.value = !isDarkMode.value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeKey, isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
