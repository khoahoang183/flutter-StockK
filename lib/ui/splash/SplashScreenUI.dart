import 'package:flutter/material.dart';

class SplashScreenUI extends StatelessWidget {
  const SplashScreenUI({Key? key}) : super(key: key);

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
                Image.asset(
                    width: 150, height: 150, "assets/images/ic_logo.png"),
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 20, 5, 20),
                  child: Text(screenContent,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 18)),
                )
              ],
            )),
      ),
    );
  }
}
