import 'package:flutter/material.dart';

// UI StatefulWidget
class HomeScreenUserUI extends StatefulWidget {
  const HomeScreenUserUI({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenUserState();
  }
}

// State HomeScreenState
class HomeScreenUserState extends State<HomeScreenUserUI> {
  HomeScreenUserState();

  @override
  Widget build(BuildContext context) {
    return Text("User");;
  }
}
