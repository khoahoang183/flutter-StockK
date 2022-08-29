import 'package:flutter/material.dart';
import 'package:stockk_flutter/resources/ResourceColors.dart';
import 'package:stockk_flutter/resources/ResourceStrings.dart';
import 'package:stockk_flutter/ui/home/main/HomeScreenMainUI.dart';
import 'package:stockk_flutter/ui/home/HomeScreenNotiUI.dart';
import 'package:stockk_flutter/ui/home/HomeScreenSearchUI.dart';

import '../../resources/ResourceImage.dart';
import '../../util/view/system/SysAppBar.dart';
import 'HomeScreenUserUI.dart';

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
      icon: Image.asset(width: 20, height: 20, "${ResourceImages.AssetsPrefix}icon_home_search.png"),
      label: ResourceStrings.home_screen_navigate_home,
    ),
    BottomNavigationBarItem(
      icon: Image.asset(width: 20, height: 20, "${ResourceImages.AssetsPrefix}icon_home_search.png"),
      label: ResourceStrings.home_screen_navigate_search,
    ),
    BottomNavigationBarItem(
      icon: Image.asset(width: 20, height: 20, "${ResourceImages.AssetsPrefix}icon_home_noti.png"),
      label: ResourceStrings.home_screen_navigate_noti,
    ),
    BottomNavigationBarItem(
      icon: Image.asset(width: 20, height: 20, "${ResourceImages.AssetsPrefix}icon_home_user.png"),
      label: ResourceStrings.home_screen_navigate_user,
    )
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }

  void _onTapBottomNavigationBar(int index) {
    setState(() {
      _currentSelectedIndex = index;
    });
  }
}
