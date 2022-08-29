

import 'package:flutter/material.dart';

// UI StatefulWidget
class HomeScreenSearchUI extends StatefulWidget {
  const HomeScreenSearchUI({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenSearchState();
  }
}

// State HomeScreenState
class HomeScreenSearchState extends State<HomeScreenSearchUI> {
  HomeScreenSearchState();

  @override
  Widget build(BuildContext context) {
    return Text("Search");;
  }
}

