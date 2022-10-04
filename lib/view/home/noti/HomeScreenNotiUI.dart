import 'package:flutter/material.dart';

import '../../../resources/ResourceStrings.dart';
import '../../../util/view/custom/CusTopBarWidget.dart';

// UI StatefulWidget
class HomeScreenNotiUI extends StatefulWidget {
  const HomeScreenNotiUI({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenNotiState();
  }
}

// State HomeScreenState
class HomeScreenNotiState extends State<HomeScreenNotiUI> with AutomaticKeepAliveClientMixin {
  HomeScreenNotiState();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CusTopBarWidget(
              titleString: ResourceStrings.home_screen_noti_title,
              isVisibleLeftImage: false,
              isVisibleRightImage: false,
              urlRightImage: "",
              urlLeftImage: "",
              onTapRightImageCallback: () {},
              onTapLeftImageCallback: () {},
            ),
            Expanded(child: const Text("")),
          ],
        ));
  }
}
