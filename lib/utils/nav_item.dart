import 'package:flutter/material.dart';

import '../app/modules/Privacy/views/privacy_screen.dart';
import '../app/modules/all property/view/all_property_screen.dart';
import '../app/modules/blogs/views/blog_item.dart';
import '../app/modules/contact/views/contact_screen.dart';
import '../app/modules/favourite/view/faviorite_screen.dart';
import '../app/modules/profile/views/profile_screen.dart';

final List<Map<String, dynamic>> navItem = [
  {'icon': Icons.person, 'title': 'Profile', 'screen': Profile_Screen ()},
  {
    'icon': Icons.add_home_outlined,
    'title': 'All Property',
    'screen': AllPropertyScreen()
  },
  {
    'icon': Icons.favorite_border,
    'title': 'Favorite',
    'screen': const FavoriteScreen()
  },
  {'icon': Icons.library_books, 'title': 'Blogs', 'screen': const BlogItem()},
  {
    'icon': Icons.privacy_tip_outlined,
    'title': 'Privacy',
    'screen': const PrivacyScreen()
  },
  {'icon': Icons.message, 'title': 'Contact Us', 'screen': ContactScreen()},
];
