import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stockk_flutter/model/ProductModel.dart';
import 'package:stockk_flutter/resources/ResourceColors.dart';
import 'package:stockk_flutter/resources/ResourceDimens.dart';
import 'package:stockk_flutter/resources/ResourceStrings.dart';
import 'package:stockk_flutter/util/view/system/SysRefreshIndicator.dart';

import '../../../resources/ResourceImage.dart';
import '../../../util/view/custom/CusDividerLine.dart';
import 'HomeSearchProductListTitle.dart';

/// UI StatefulWidget
class HomeScreenSearchUI extends StatefulWidget {
  const HomeScreenSearchUI({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenSearchState();
  }
}

/// State HomeScreenState
class HomeScreenSearchState extends State<HomeScreenSearchUI> {
  HomeScreenSearchState();

  List<ProductModel> _lstProductSearch = <ProductModel>[];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            buildSearchWidget(),
            CusDividerLine(),
            buildListGridSearch()
          ],
        ));
  }

  /// buildSearchWidget
  Widget buildSearchWidget() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: ResourceDimens.view_toolbar_height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(ResourceDimens.dimen_20),
              child: Image.asset(
                  width: ResourceDimens.view_height_20,
                  height: ResourceDimens.view_height_20,
                  "${ResourceImages.AssetsPrefix}icon_home_loupe.png")),
          const Expanded(
            child: TextField(
                decoration: InputDecoration.collapsed(
              hintText: ResourceStrings.home_screen_search_hint,
            )),
          ),
          GestureDetector(
            onTap: onTapImageSearch,
            child: Padding(
                padding: const EdgeInsets.all(ResourceDimens.dimen_20),
                child: Image.asset(
                    width: ResourceDimens.view_height_20,
                    height: ResourceDimens.view_height_20,
                    "${ResourceImages.AssetsPrefix}icon_home_filter.png")),
          ),
        ],
      ),
    );
  }

  /// buildListGridSearch
  Widget buildListGridSearch() {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(
              ResourceDimens.dimen_5, ResourceDimens.dimen_10, ResourceDimens.dimen_5, ResourceDimens.dimen_0),
          child: SysRefreshIndicator(
            onRefresh: onRefreshIndicator,
            child: ListView(
              children: <Widget>[
                GridView.count(
                  crossAxisCount: 2,
                  physics: const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                  shrinkWrap: true, // You won't see infinite size error
                  children: List.generate(
                    _lstProductSearch.length,
                    (index) => HomeSearchProductListTitle(model: _lstProductSearch[index]),
                  ),
                )
              ],
            ),
          )),
    );
  }

  /// onTapImageSearch
  void onTapImageSearch() {
    setState(() {
      _lstProductSearch = ProductModel().createDummyData();

      String json = jsonEncode(_lstProductSearch.map((e) => e.toJson()).toList());
    });
  }

  /// onRefreshIndicator
  Future<void> onRefreshIndicator() async {
    setState(() {
      _lstProductSearch.clear();
    });
  }
}
