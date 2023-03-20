import 'package:dashboard/providers/sectores_provider.dart';
import 'package:dashboard/providers/sucursales_provider.dart';
import 'package:dashboard/responsive/desktop_layout.dart';
import 'package:dashboard/responsive/mobile_layout.dart';
import 'package:dashboard/responsive/responsive_layout.dart';
import 'package:dashboard/responsive/tablet_layout.dart';
import 'package:dashboard/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const StateApp());
}

class StateApp extends StatelessWidget {
  const StateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SucursalesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SectoresProvider(),
        )
      ],
      child: MainApp(),
    );
  }
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
