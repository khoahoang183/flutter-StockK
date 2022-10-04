// UI StatefulWidget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/ResourceColors.dart';

class FAQScreenUI extends StatefulWidget {
  const FAQScreenUI({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FAQScreenState();
  }
}


// State HomeScreenState
class FAQScreenState extends State<FAQScreenUI> {
  FAQScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: hexToColor(ResourceColors.color_white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            ],
          )),
    );
  }

}