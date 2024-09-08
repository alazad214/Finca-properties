import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/utils/app_config.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import '../../search/view/search_page.dart';

class HeaderView extends StatelessWidget {
  final VoidCallback? onpressed;

  const HeaderView({super.key, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 10.0, right: 15.0, bottom: 25.0, top: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/heade_bg.jpg'), // Update with your image path
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(40.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: onpressed,
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              const CustomText(
                text: AppConfig.appName,
                fontsize: 19.0,
                color: Colors.white,
              ),
              const Spacer(),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          SearchPage()
        ],
      ),
    );
  }
}
