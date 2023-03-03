import 'package:flutter/material.dart';

class NuevoSector extends StatelessWidget {
  const NuevoSector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 500,
      child: AlertDialog(
        backgroundColor: Colors.blue,
      ),
    );
  }
}
