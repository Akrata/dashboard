import 'package:dashboard/widgets/custom_expanded_sizde.dart';
import 'package:dashboard/widgets/custom_side_menu.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({Key? key}) : super(key: key);

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  final PageController pageController = PageController();
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //menu lateral
          CustomSideMenu(pageController: pageController),
          //parte principal
          CustomExpandedSide(pageController: pageController),
        ],
      ),
    );
  }
}
