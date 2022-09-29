import 'package:flutter/material.dart';
import 'package:stockk_flutter/resources/ResourceColors.dart';
import 'package:stockk_flutter/resources/ResourceDimens.dart';
import 'package:stockk_flutter/resources/ResourceStrings.dart';
import 'package:stockk_flutter/ui/home/main/HomeScreenMainUI.dart';
import 'package:stockk_flutter/ui/home/noti/HomeScreenNotiUI.dart';
import 'package:stockk_flutter/ui/home/search/HomeScreenSearchUI.dart';

import '../../resources/ResourceImage.dart';
import '../../util/view/system/SysAppBar.dart';
import 'user/HomeScreenUserUI.dart';

// UI StatefulWidget
class HomeScreenUI extends StatefulWidget {
  const HomeScreenUI({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

// State HomeScreenState
class HomeScreenState extends State<HomeScreenUI> {
  HomeScreenState();

  final _pageController = PageController();
  int _currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false; // disable back press
        },
        child: Scaffold(
          appBar: SysAppBar(),
          body: Center(
              //child: _lstPageUI.elementAt(_currentSelectedIndex),
              child: PageView(
                  physics: const NeverScrollableScrollPhysics(), // disable horizontal scroll of user
                  controller: _pageController,
                  children: const <Widget>[
                HomeScreenMainUI(),
                HomeScreenSearchUI(),
                HomeScreenNotiUI(),
                HomeScreenUserUI(),
              ])),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentSelectedIndex,
            selectedItemColor: hexToColor(ResourceColors.color_green_main),
            unselectedItemColor: hexToColor(ResourceColors.color_bg_gray_select_1),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: _onTapBottomNavigationBar,
            items: <BottomNavigationBarItem>[
              buildBottomNavigationBarItem(
                  "${ResourceImages.AssetsPrefix}icon_home_user.png", ResourceStrings.home_screen_navigate_user),
              buildBottomNavigationBarItem(
                  "${ResourceImages.AssetsPrefix}icon_home_search.png", ResourceStrings.home_screen_navigate_search),
              buildBottomNavigationBarItem(
                  "${ResourceImages.AssetsPrefix}icon_home_noti.png", ResourceStrings.home_screen_navigate_noti),
              buildBottomNavigationBarItem(
                  "${ResourceImages.AssetsPrefix}icon_home_user.png", ResourceStrings.home_screen_navigate_user)
            ],
          ),
        ));
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(String itemImageSrc, String itemLabelSrc) {
    return BottomNavigationBarItem(
      icon: Image.asset(width: ResourceDimens.view_height_20, height: ResourceDimens.view_height_20, itemImageSrc),
      activeIcon: Image.asset(
          width: ResourceDimens.view_height_20,
          height: ResourceDimens.view_height_20,
          itemImageSrc,
          color: hexToColor(ResourceColors.color_green_main)),
      label: itemLabelSrc,
    );
  }

  void _onTapBottomNavigationBar(int index) {
    setState(() {
      _currentSelectedIndex = index;
      _pageController.animateToPage(_currentSelectedIndex,
          duration: const Duration(milliseconds: 400), curve: Curves.ease);
    });
  }
}
