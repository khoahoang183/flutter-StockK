import 'package:flutter/material.dart';

import '../../resources/ResourceImage.dart';

class HomeProductListTile extends StatelessWidget {
  const HomeProductListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          Image.asset(width: 80, height: 80, "${ResourceImages.AssetsPrefix}img_home_ads_1.png", fit: BoxFit.cover),
          const Text("dat dsa dsa dsadasa")
        ],
      ),
    ));
  }
}
