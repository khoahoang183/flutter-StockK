import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stockk_flutter/ui/home/HomeScreenUI.dart';
import '../../model/ProductModel.dart';
import '../../resources/ResourceImage.dart';
import '../../util/view/system/SysAppBar.dart';

class HomeScreenState extends State<HomeScreenUI> {
  HomeScreenState();

  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _lstChildrenPageView = [
    Center(child: Image.asset("${ResourceImages.AssetsPrefix}img_home_ads_1.png", fit: BoxFit.cover)),
    Center(child: Image.asset("${ResourceImages.AssetsPrefix}img_home_ads_2.png", fit: BoxFit.cover)),
    Center(child: Image.asset("${ResourceImages.AssetsPrefix}img_home_ads_3.png", fit: BoxFit.cover)),
  ];

  final List<ProductModel> _lstProduct = ProductModel().getDummyList();

  @override
  void initState() {
    super.initState();

    // Handle State of PageView ads
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage == _lstChildrenPageView.length - 1) {
        _currentPage = 0;
      } else {
        _currentPage++;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SysAppBar(),
        body: RefreshIndicator(
            onRefresh: () async {},
            child: SingleChildScrollView(
                child: Column(
              children: [
                // PageView top ads
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: PageView(controller: _pageController, children: _lstChildrenPageView),
                ),
                SizedBox(
                    width: double.infinity,
                    child: ListView.builder(
                        physics: const ClampingScrollPhysics(), // Disable scroll
                        shrinkWrap: true, // Set Height in view
                        itemCount: _lstProduct.length,
                        itemBuilder: (context, index) {
                          return ListTile(title: Text(_lstProduct[index].name));
                        })),
              ],
            ))));
  }
}
