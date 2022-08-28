import 'package:flutter/material.dart';
import 'package:stockk_flutter/resources/ResourceColors.dart';
import 'package:stockk_flutter/resources/ResourceImage.dart';
import 'package:stockk_flutter/resources/ResourceStrings.dart';
import 'package:stockk_flutter/ui/home/HomeScreenUI.dart';
import 'SplashScreenUI.dart';

class SplashScreenState extends State<SplashScreenUI> {
  SplashScreenState();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
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
                      width: 120,
                      height: 120,)
                ),
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