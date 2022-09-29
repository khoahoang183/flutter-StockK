import 'package:flutter/material.dart';
import 'package:stockk_flutter/resources/ResourceDimens.dart';

import '../../resources/ResourceColors.dart';
import '../../resources/ResourceImage.dart';
import '../home/HomeScreenUI.dart';

/// UI StatefulWidget
class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

/// State class
class SplashScreenState extends State<SplashScreenUI> {
  SplashScreenState();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HomeScreenUI()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: hexToColor(ResourceColors.color_green_main),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Img Logo
              InkWell(
                  onTap: Event_onTap_imgLogo,
                  child: Image.asset("${ResourceImages.AssetsPrefix}img_logo_gray.png",
                      width: ResourceDimens.view_height_100, height: ResourceDimens.view_height_100)),
            ],
          )),
    );
  }

  // ignore: non_constant_identifier_names
  void Event_onTap_imgLogo() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeScreenUI()));
  }
}

