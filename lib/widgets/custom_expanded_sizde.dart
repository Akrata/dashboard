import 'package:dashboard/pages/home_page.dart';
import 'package:dashboard/pages/sectores_page.dart';
import 'package:dashboard/themes/app_theme.dart';
import 'package:dashboard/widgets/widget.dart';
import 'package:flutter/material.dart';

class CustomExpandedSide extends StatefulWidget {
  final PageController pageController;
  const CustomExpandedSide({super.key, required this.pageController});

  @override
  State<CustomExpandedSide> createState() =>
      _CustomExpandedSideState(pageController: pageController);
}

class _CustomExpandedSideState extends State<CustomExpandedSide> {
  final PageController pageController;
  int _selectedPage = 0;
  _CustomExpandedSideState({required this.pageController});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Column(
          children: [
            //appbar
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("Crami Soporte",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primary,
                            fontSize: 25,
                          )),
                      color: Colors.white,
                      height: 50,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 25),
                    color: Colors.white,
                    child: Row(
                      children: [
                        CustomIconMenu(
                            icon: Icons.person_2_outlined,
                            onPressed: () {
                              pageController.animateToPage(7,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                              setState(() {
                                _selectedPage = 7;
                              });
                            }),
                        CustomIconMenu(
                            icon: Icons.exit_to_app,
                            onPressed: () {
                              pageController.animateToPage(8,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                              setState(() {
                                _selectedPage = 8;
                              });
                            })
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                margin: EdgeInsets.all(20),
                width: double.infinity,
                child: PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _selectedPage = value;
                    });
                  },
                  children: [
                    HomePage(screenName: '0'),
                    SectoresPage(),
                    HomePage(screenName: '2'),
                    HomePage(screenName: '3'),
                    HomePage(screenName: '4'),
                    HomePage(screenName: '5'),
                    HomePage(screenName: '6'),
                    HomePage(screenName: '7'),
                    HomePage(screenName: '8'),
                  ],
                ),
              ),
            )
            //contenidod de cada pagina
          ],
        ),
      ),
    );
  }
}
