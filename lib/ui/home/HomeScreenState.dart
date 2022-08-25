import 'package:flutter/material.dart';
import 'package:stockk_flutter/ui/home/HomeScreenUI.dart';

class HomeScreenState extends State<HomeScreenUI> {
  final screenTitle = "Splash Screen";
  final screenContent = "Welcome to Splashscreen";

  HomeScreenState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: screenTitle,
      home: Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Back"),
                )
              ],
            )),
      ),
    );
  }
}