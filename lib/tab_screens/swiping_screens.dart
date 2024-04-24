import 'package:flutter/material.dart';

class SwipingScreens extends StatefulWidget {
  const SwipingScreens({ Key? key }) : super(key: key);

  @override
  _SwipingScreensState createState() => _SwipingScreensState();
}

class _SwipingScreensState extends State<SwipingScreens> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Text('Swping screen')
        ],
      ),
    ));
  }
}