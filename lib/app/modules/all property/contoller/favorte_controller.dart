import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FavoriteController extends GetxController {
  var favoriteItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void toggleFavorite(Map<String, dynamic> item) async {
    final index = favoriteItems.indexWhere((fav) => fav['id'] == item['id']);
    if (index != -1) {
      favoriteItems.removeAt(index);
      Fluttertoast.showToast(
        msg: "Removed from favorites",
      );
    } else {
      favoriteItems.add(item);
      Fluttertoast.showToast(
        msg: "Added to favorites",
      );
    }
    await saveFavorites();
    update();
  }

  bool isFavorite(String itemId) {
    return favoriteItems.any((fav) => fav['id'] == itemId);
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = jsonEncode(favoriteItems);
    await prefs.setString('favorite_items', favoritesJson);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getString('favorite_items');
    if (favoritesJson != null) {
      final List<dynamic> favoritesList = jsonDecode(favoritesJson);
      favoriteItems.value = favoritesList.cast<Map<String, dynamic>>();
    }
  }
}
