import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/add%20property/controller/add_controller.dart';
import 'package:universe_it_project/presentation/modules/add%20property/views/addscreen2.dart';
import 'package:universe_it_project/presentation/modules/add%20property/views/addscreen3.dart';
import 'package:universe_it_project/widgets/custom_dialog.dart';
import 'addscreen1.dart';

class AddPropertyScreen extends StatelessWidget {
  AddPropertyScreen({super.key});

  final _pageController = PageController();
  final controller = Get.put(AddController());

  Future<bool> _onWillPop(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (context) => CustomDialog(
        title: 'Do you go to the previous page without posting?',
        onConfirm: () {
          Navigator.of(context).pop(true);
        },
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Addscreen1(
              pageController: _pageController,
            ),
            Addscreen2(pageController: _pageController),
            Addscreen3(pageController: _pageController),
          ],
        ),
      ),
      onWillPop: () => _onWillPop(context),
    );
  }
}
