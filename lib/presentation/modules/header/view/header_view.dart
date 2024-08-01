import 'package:flutter/material.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import '../../../../utils/app_string.dart';
import '../../../../widgets/custom_searchBar.dart';

class HeaderView extends StatelessWidget {
  final onpressed;
  const HeaderView({super.key, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 10.0, right: 15.0, bottom: 25.0, top: 10.0),
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0))),
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
                  )),
              const CustomText(
                text: AppString.name,
                fontsize: 19.0,
                color: Colors.white,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ))
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const CustomSearchBar(),
        ],
      ),
    );
  }
}
