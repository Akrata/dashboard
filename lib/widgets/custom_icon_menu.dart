import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class CustomIconMenu extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  const CustomIconMenu(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: AppTheme.primary,
      onPressed: onPressed,
      icon: Icon(icon),
      iconSize: 30,
      padding: const EdgeInsets.all(10),
    );
  }
}
