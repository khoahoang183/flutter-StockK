import 'package:flutter/material.dart';

import '../../../resources/ResourceColors.dart';
import '../../../resources/ResourceDimens.dart';
import '../../../resources/ResourceImage.dart';
import '../../../resources/ResourceStrings.dart';

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
    return Container(
        color: Colors.white,
        child: Column(
          children: [buildTopBarWidget(), buildLoginWidget()],
        ));
  }

  /// buildTopBarWidget
  Widget buildTopBarWidget() {
    return SizedBox(
      width: double.infinity,
      height: ResourceDimens.view_toolbar_height,
      child: Center(
          child: Column(children: [
        Row(
          children: [
            GestureDetector(
              onTap: onTapImageFAQ,
              child: Padding(
                  padding: const EdgeInsets.all(ResourceDimens.padding_20),
                  child: Image.asset(
                      width: ResourceDimens.view_height_20,
                      height: ResourceDimens.view_height_20,
                      "${ResourceImages.AssetsPrefix}icon_home_filter.png")),
            ),
            const Expanded(
                child: Text(ResourceStrings.home_screen_account_title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ResourceDimens.text_size_18,
                      fontWeight: FontWeight.bold,
                    ))),
            const SizedBox(
              width: ResourceDimens.view_height_20,
              height: ResourceDimens.view_height_20,
            ),
          ],
        ),
        Divider(color: hexToColor(ResourceColors.color_text_gray_2))
      ])),
    );
  }

  /// buildLoginWidget
  Widget buildLoginWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
            width: ResourceDimens.view_height_120,
            height: ResourceDimens.view_height_120,
            fit: BoxFit.cover,
            "${ResourceImages.AssetsPrefix}img_logo_2.png"),
        Text("ewq")
      ],
    );
  }

  /// onTapImageFAQ
  void onTapImageFAQ() {}
}
