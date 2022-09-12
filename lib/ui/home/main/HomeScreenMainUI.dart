import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stockk_flutter/model/ProductCategoryModel.dart';
import 'package:stockk_flutter/model/ProductGroupModel.dart';
import 'package:stockk_flutter/resources/ResourceColors.dart';
import 'package:stockk_flutter/resources/ResourceDimens.dart';
import 'package:stockk_flutter/ui/home/main/HomeProductGroupListTitle.dart';

import '../../../base/function/BaseFetchFunction.dart';
import '../../../base/model/BaseResponseModel.dart';
import '../../../resources/ResourceImage.dart';
import '../../../resources/ResourceStrings.dart';
import '../../../util/view/system/SysAppBar.dart';
import '../../../util/view/system/SysRefreshIndicator.dart';
import 'HomeProductListTitle.dart';

// UI StatefulWidget
class HomeScreenMainUI extends StatefulWidget {
  const HomeScreenMainUI({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

// State HomeScreenState
class HomeScreenState extends State<HomeScreenMainUI> {
  HomeScreenState();

  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _lstPageView = [
    Image.asset("${ResourceImages.AssetsPrefix}img_home_ads_1.png", fit: BoxFit.cover),
    Image.asset("${ResourceImages.AssetsPrefix}img_home_ads_2.png", fit: BoxFit.cover),
    Image.asset("${ResourceImages.AssetsPrefix}img_home_ads_3.png", fit: BoxFit.cover),
  ];

  late Future<List<ProductCategoryModel>?> _lstCategory;
  late Future<List<BaseResponseModel>> model;
  final List<ProductGroupModel> _lstGroupProduct = ProductGroupModel().createDummyData();

  @override
  void initState() {
    super.initState();

    // fetch _lstCategory
    _lstCategory = fetchDataList<List<ProductCategoryModel>>(
        "https://3f9675a4-47b4-4bf3-9a25-94f1fdf92d3b.mock.pstmn.io/productCategory");

    // Handle State of PageView ads
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage == _lstPageView.length - 1) {
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
        body: SysRefreshIndicator(
            onRefresh: () async {},
            child: SingleChildScrollView(
                child: Container(
                    color: hexToColor(ResourceColors.color_white),
                    child: Column(
                      children: [
                        // PageView top ads
                        SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: PageView(controller: _pageController, children: _lstPageView),
                        ),
                        buildProductCategoryWidget(),
                        buildProductGroupWidget()
                      ],
                    )))));
  }

  /// buildCategoryWidget
  Widget buildProductCategoryWidget() {
    return // Content
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            ResourceStrings.home_screen_category_title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: ResourceDimens.text_size_18, fontWeight: FontWeight.bold),
                          )),
                    ),
                    FutureBuilder(
                        future: _lstCategory,
                        builder: (context, AsyncSnapshot<List<ProductCategoryModel>?> snapshot) {
                          if (!snapshot.hasData) {
                            return const SizedBox(height: 120);
                          } else {
                            return SizedBox(
                              height: 120,
                              child: ListView.builder(
                                  physics: const ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return HomeCategoryListTitle(model: snapshot.data![index]);
                                  }),
                            );
                          }
                        }),
                  ],
                )));
  }

  /// buildCategoryWidget
  Widget buildProductGroupWidget() {
    return // Content
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: double.infinity,
              child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _lstGroupProduct.length,
                  itemBuilder: (context, index) {
                    return HomeProductGroupListTitle(model: _lstGroupProduct[index]);
                  }),
            ));
  }
}
