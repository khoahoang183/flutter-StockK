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

  int _currentSelectedIndex = 0;
  static const List<Widget> _lstPageUI = <Widget>[
    HomeScreenMainUI(),
    HomeScreenSearchUI(),
    HomeScreenNotiUI(),
    HomeScreenUserUI(),
  ];

  static final List<BottomNavigationBarItem> _lstBottomNavigationBarItem = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Image.asset(
          width: ResourceDimens.view_height_20,
          height: ResourceDimens.view_height_20,
          "${ResourceImages.AssetsPrefix}icon_home_increase.png",
          color: hexToColor(ResourceColors.color_text_gray_6)),
      activeIcon: Image.asset(
        width: ResourceDimens.view_height_20,
        height: ResourceDimens.view_height_20,
        "${ResourceImages.AssetsPrefix}icon_home_increase.png",
        color: hexToColor(ResourceColors.color_green_main),
      ),
      label: ResourceStrings.home_screen_navigate_home,
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
          width: ResourceDimens.view_height_20,
          height: ResourceDimens.view_height_20,
          "${ResourceImages.AssetsPrefix}icon_home_search.png"),
      activeIcon: Image.asset(
        width: ResourceDimens.view_height_20,
        height: ResourceDimens.view_height_20,
        "${ResourceImages.AssetsPrefix}icon_home_search.png",
        color: hexToColor(ResourceColors.color_green_main),
      ),
      label: ResourceStrings.home_screen_navigate_search,
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
          width: ResourceDimens.view_height_20,
          height: ResourceDimens.view_height_20,
          "${ResourceImages.AssetsPrefix}icon_home_noti.png"),
      activeIcon: Image.asset(
          width: ResourceDimens.view_height_20,
          height: ResourceDimens.view_height_20,
          "${ResourceImages.AssetsPrefix}icon_home_noti.png",
          color: hexToColor(ResourceColors.color_green_main)),
      label: ResourceStrings.home_screen_navigate_noti,
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
          width: ResourceDimens.view_height_20,
          height: ResourceDimens.view_height_20,
          "${ResourceImages.AssetsPrefix}icon_home_user.png"),
      activeIcon: Image.asset(
          width: ResourceDimens.view_height_20,
          height: ResourceDimens.view_height_20,
          "${ResourceImages.AssetsPrefix}icon_home_user.png",
          color: hexToColor(ResourceColors.color_green_main)),
      label: ResourceStrings.home_screen_navigate_user,
    )
  ];

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
            child: _lstPageUI.elementAt(_currentSelectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentSelectedIndex,
            selectedItemColor: hexToColor(ResourceColors.color_green_main),
            unselectedItemColor: hexToColor(ResourceColors.color_bg_gray_select_1),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: _onTapBottomNavigationBar,
            items: _lstBottomNavigationBarItem,
          ),
        ));
  }

  void _onTapBottomNavigationBar(int index) {
    setState(() {
      _currentSelectedIndex = index;
    });
  }
}
