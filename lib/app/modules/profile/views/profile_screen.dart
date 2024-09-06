import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../Auth/signin/controller/signin _controller.dart';
import '../../my_properties/views/property_list_screen.dart';
import '../controller/image_controller.dart';
import '../widgets/profile_listtile.dart';
import 'dashboard_screen.dart';
import 'edit_profile.dart';

class Profile_Screen extends StatelessWidget {
  Profile_Screen({super.key});
  final ImageController imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile image--->
              Container(
                height: 120,
                width: 120,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 2),
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage("assets/images/p.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Waliullah Ripon",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                "waliullah.ripon@example.com",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40.0),
              ProfileListtile(
                icon: Icons.person,
                title: "Edit Profile",
                arrowicon: Iconsax.edit,
                ontap: () {
                  Get.to(() => EditProfile());
                },
              ),
              ProfileListtile(
                icon: Icons.dashboard,
                title: "Dashboard",
                arrowicon: Iconsax.arrow_right,
                ontap: () {
                  Get.to(() => DeshboardScreen());
                },
              ),
              ProfileListtile(
                icon: Iconsax.home4,
                title: "Property List",
                arrowicon: Iconsax.arrow_right,
                ontap: () {
                  Get.to(() => PropertyListScreen());
                },
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                height: 50.0,
                width: screenSize.width / 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    controller.logOut();
                    Get.snackbar("Successfully", "Logged Out");
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
