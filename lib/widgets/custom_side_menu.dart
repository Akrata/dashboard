import 'package:dashboard/themes/app_theme.dart';
import 'package:dashboard/widgets/widget.dart';
import 'package:flutter/material.dart';

class CustomSideMenu extends StatefulWidget {
  final PageController pageController;
  const CustomSideMenu({super.key, required this.pageController});

  @override
  State<CustomSideMenu> createState() => _CustomSideMenuState();
}

class _CustomSideMenuState extends State<CustomSideMenu> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: 80,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Container(
            //menu
            height: 50,
            decoration: BoxDecoration(color: AppTheme.primary),
            child: Center(
              child: Text(
                "M E N U",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          //botones menu
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            // color: Colors.red,
            height: size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomIconMenu(
                      icon: Icons.home,
                      onPressed: () {},
                    ),
                    CustomIconMenu(
                      icon: Icons.question_mark,
                      onPressed: () {},
                    ),
                    CustomIconMenu(
                      icon: Icons.chat_bubble,
                      onPressed: () {},
                    ),
                    CustomIconMenu(
                      icon: Icons.pending,
                      onPressed: () {},
                    ),
                    CustomIconMenu(
                      icon: Icons.graphic_eq,
                      onPressed: () {},
                    ),
                    CustomIconMenu(
                      icon: Icons.people,
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                  child: CustomIconMenu(
                    icon: Icons.settings,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
