import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'mycolor.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;

  MyBottomNavBar({Key? key,required this.onTabChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.00),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
          mainAxisAlignment: MainAxisAlignment.center,
          activeColor: MyColor.mainBlackColor,color: MyColor.grey2,
          gap: 8,
          tabActiveBorder: Border.all(color: MyColor.mainBlackColor),
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Shop",
            ),
            GButton(
              icon: Icons.shopping_bag,
              text: "Chart",
            ),
            GButton(
              icon: Icons.exit_to_app,
              text: "LogOut",
            ),
          ]),
    );
  }
}
