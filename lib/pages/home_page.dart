import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String screenName;
  const HomePage({Key? key, required this.screenName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [Text(screenName)],
            ),
          )
        ],
      ),
    );
  }
}
