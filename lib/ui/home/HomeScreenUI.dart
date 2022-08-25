import 'package:flutter/material.dart';

class HomeScreenUI extends StatelessWidget {
  const HomeScreenUI({Key? key}) : super(key: key);

  final screenTitle = "Splash Screen";
  final screenContent = "Welcome to Splashscreen";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: screenTitle,
      home: Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.yellowAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

              ],
            )),
      ),
    );
  }
}
