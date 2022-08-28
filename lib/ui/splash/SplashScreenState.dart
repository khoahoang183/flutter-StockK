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
    return MaterialApp(
      title: ResourceString.splash_screen_title,
      home: Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: hexToColor(ResourceColor.color_bg_yellow_main),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Img Logo
                InkWell(
                    onTap: Event_onTap_imgLogo,
                    child: Image.asset("${ResourceImage.AssetsPrefix}ic_logo.png",
                      width: 150,
                      height: 150,)
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 20, 5, 20),
                  child: const Text(ResourceString.splash_screen_welcome,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 18)),
                ),
              ],
            )),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void Event_onTap_imgLogo() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeScreenUI()));
  }
}