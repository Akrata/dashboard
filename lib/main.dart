import 'package:dashboard/responsive/desktop_layout.dart';
import 'package:dashboard/responsive/mobile_layout.dart';
import 'package:dashboard/responsive/responsive_layout.dart';
import 'package:dashboard/responsive/tablet_layout.dart';
import 'package:dashboard/themes/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const Scaffold(
          body: ResponsiveLayout(
              mobileLayout: MobileLayout(),
              tabletLayout: TabletLayout(),
              desktopLayout: DesktopLayout())),
    );
  }
}
