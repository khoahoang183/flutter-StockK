import 'package:flutter/material.dart';

// UI StatefulWidget
class HomeScreenNotiUI extends StatefulWidget {
  const HomeScreenNotiUI({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenNotiState();
  }
}

// State HomeScreenState
class HomeScreenNotiState extends State<HomeScreenNotiUI> {
  HomeScreenNotiState();

  @override
  Widget build(BuildContext context) {
    return Text("Noti");;
  }
}
