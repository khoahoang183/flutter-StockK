import 'package:flutter/material.dart';
import 'package:stockk_flutter/ui/faq/FAQScreenUI.dart';
import 'package:stockk_flutter/util/view/custom/CusDividerLine.dart';
import 'package:stockk_flutter/util/view/custom/CusTopBarWidget.dart';

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CusTopBarWidget(
              titleString: ResourceStrings.home_screen_account_title,
              urlLeftImage: "${ResourceImages.AssetsPrefix}icon_home_question.png",
              urlRightImage: "${ResourceImages.AssetsPrefix}icon_home_filter.png",
              // ignore: void_checks
              onTapLeftImageCallback: onTapImageFAQ,
              // ignore: void_checks
              onTapRightImageCallback: onTapImageFAQ,
              isVisibleLeftImage: true,
              isVisibleRightImage: false,
            ),
            Expanded(child: buildLoginWidget()),
          ],
        ));
  }

  /// buildLoginWidget
  Widget buildLoginWidget() {
    return Container(
      margin: const EdgeInsets.all(ResourceDimens.dimen_20),
      alignment: Alignment.center,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
        Image.asset(
            width: ResourceDimens.view_height_120,
            height: ResourceDimens.view_height_120,
            "${ResourceImages.AssetsPrefix}img_logo_2.png"),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: ResourceDimens.dimen_20),
          child: Text(textAlign: TextAlign.center, ResourceStrings.home_screen_user_login_note),
        ),
        Container(
            width: double.infinity,
            color: hexToColor(ResourceColors.color_text_gray_3),
            padding: const EdgeInsets.symmetric(vertical: ResourceDimens.dimen_15),
            margin: const EdgeInsets.symmetric(vertical: ResourceDimens.dimen_5),
            child: Text(
              ResourceStrings.home_screen_user_signup,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: ResourceDimens.text_size_12,
                  fontWeight: FontWeight.bold,
                  color: hexToColor(ResourceColors.color_white)),
            )),
        Container(
            width: double.infinity,
            decoration: BoxDecoration(border: Border.all(color: hexToColor(ResourceColors.color_text_gray_3))),
            padding: const EdgeInsets.symmetric(vertical: ResourceDimens.dimen_15),
            margin: const EdgeInsets.symmetric(vertical: ResourceDimens.dimen_5),
            child: Text(
              ResourceStrings.home_screen_user_login,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: ResourceDimens.text_size_12,
                  fontWeight: FontWeight.bold,
                  color: hexToColor(ResourceColors.color_text_gray_3)),
            )),
        CusDividerLine(),
        buildOtherWidget()
      ]),
    );
  }

  /// buildOtherWidget
  Widget buildOtherWidget() {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: ResourceDimens.dimen_10),
            child: Text(
                textAlign: TextAlign.center,
                ResourceStrings.home_screen_user_blog,
                style: TextStyle(
                    fontSize: ResourceDimens.text_size_12,
                    fontWeight: FontWeight.bold,
                    color: hexToColor(ResourceColors.color_text_gray_2)))),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: ResourceDimens.dimen_10),
            child: Text(
                textAlign: TextAlign.center,
                ResourceStrings.home_screen_user_help,
                style: TextStyle(
                    fontSize: ResourceDimens.text_size_12,
                    fontWeight: FontWeight.bold,
                    color: hexToColor(ResourceColors.color_text_gray_2)))),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: ResourceDimens.dimen_10),
            child: Text(
                textAlign: TextAlign.center,
                ResourceStrings.home_screen_user_how_it_works,
                style: TextStyle(
                    fontSize: ResourceDimens.text_size_12,
                    fontWeight: FontWeight.bold,
                    color: hexToColor(ResourceColors.color_text_gray_2)))),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: ResourceDimens.dimen_10),
            child: Text(
                textAlign: TextAlign.center,
                ResourceStrings.home_screen_user_reviews,
                style: TextStyle(
                    fontSize: ResourceDimens.text_size_12,
                    fontWeight: FontWeight.bold,
                    color: hexToColor(ResourceColors.color_text_gray_2)))),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: ResourceDimens.dimen_10),
            child: Text(
                textAlign: TextAlign.center,
                ResourceStrings.home_screen_user_currency,
                style: TextStyle(
                    fontSize: ResourceDimens.text_size_12,
                    fontWeight: FontWeight.bold,
                    color: hexToColor(ResourceColors.color_text_gray_2)))),
      ],
    );
  }

  /// onTapImageFAQ
  void onTapImageFAQ() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const FAQScreenUI()));
  }
}
