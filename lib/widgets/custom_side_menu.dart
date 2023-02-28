import 'package:dashboard/themes/app_theme.dart';
import 'package:dashboard/widgets/widget.dart';
import 'package:flutter/material.dart';

class CustomSideMenu extends StatefulWidget {
  final PageController pageController;
  const CustomSideMenu({super.key, required this.pageController});

  @override
  State<CustomSideMenu> createState() =>
      _CustomSideMenuState(pageController: pageController);
}

class _CustomSideMenuState extends State<CustomSideMenu> {
  final PageController pageController;
  int _selectedPage = 0;

  _CustomSideMenuState({required this.pageController});
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
                      onPressed: () {
                        pageController.animateToPage(0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                        setState(() {
                          _selectedPage = 0;
                        });
                      },
                    ),
                    CustomIconMenu(
                      icon: Icons.question_mark,
                      onPressed: () {
                        pageController.animateToPage(1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                        setState(() {
                          _selectedPage = 1;
                        });
                      },
                    ),
                    CustomIconMenu(
                      icon: Icons.chat_bubble,
                      onPressed: () {
                        pageController.animateToPage(2,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                        setState(() {
                          _selectedPage = 2;
                        });
                      },
                    ),
                    CustomIconMenu(
                      icon: Icons.pending,
                      onPressed: () {
                        pageController.animateToPage(3,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                        setState(() {
                          _selectedPage = 3;
                        });
                      },
                    ),
                    CustomIconMenu(
                      icon: Icons.graphic_eq,
                      onPressed: () {
                        pageController.animateToPage(4,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                        setState(() {
                          _selectedPage = 4;
                        });
                      },
                    ),
                    CustomIconMenu(
                      icon: Icons.people,
                      onPressed: () {
                        pageController.animateToPage(5,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                        setState(() {
                          _selectedPage = 5;
                        });
                      },
                    ),
                  ],
                ),
                Container(
                  child: CustomIconMenu(
                    icon: Icons.settings,
                    onPressed: () {
                      pageController.animateToPage(6,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                      setState(() {
                        _selectedPage = 6;
                      });
                    },
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
