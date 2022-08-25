import 'package:flutter/material.dart';

import 'HomeScreenState.dart';

class HomeScreenUI extends StatefulWidget {
  const HomeScreenUI({Key? key}) : super(key: key);

  final screenTitle = "Splash Screen";
  final screenContent = "Welcome to Splashscreen";

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }

}
