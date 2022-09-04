import 'package:flutter/material.dart';
import 'package:stockk_flutter/ui/faq/FAQScreenUI.dart';
import 'package:stockk_flutter/util/view/custom/CusTopBarWidget.dart';

import '../../../resources/ResourceColors.dart';
import '../../../resources/ResourceDimens.dart';
import '../../../resources/ResourceImage.dart';
import '../../../resources/ResourceStrings.dart';
import '../../../util/view/custom/CusDividerLine.dart';

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
          children: [buildTopBarWidget(), CusDividerLine(), buildLoginWidget()],
        ));
  }

  /// buildTopBarWidget
  Widget buildTopBarWidget() {
    return CusTopBarWidget(
        titleString: ResourceStrings.home_screen_account_title,
        urlLeftImage: "${ResourceImages.AssetsPrefix}icon_home_filter.png",
        urlRightImage: "${ResourceImages.AssetsPrefix}icon_home_filter.png",
        // ignore: void_checks
        onTapLeftImageCallback: onTapImageFAQ,
        // ignore: void_checks
        onTapRightImageCallback: onTapImageFAQ);
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
        const Text("ewq")
      ],
    );
  }

  /// onTapImageFAQ
  void onTapImageFAQ() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const FAQScreenUI()));
  }
}
