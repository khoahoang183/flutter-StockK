import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stockk_flutter/model/ProductAdsModel.dart';
import 'package:stockk_flutter/model/ProductCategoryModel.dart';
import 'package:stockk_flutter/model/ProductGroupModel.dart';
import 'package:stockk_flutter/network/response/ProductAdsResponse.dart';
import 'package:stockk_flutter/network/response/ProductCategoriesResponse.dart';
import 'package:stockk_flutter/network/response/ProductGroupModelsResponse.dart';
import 'package:stockk_flutter/resources/ResourceColors.dart';
import 'package:stockk_flutter/resources/ResourceDimens.dart';
import 'package:stockk_flutter/ui/home/main/HomeProductGroupListTitle.dart';

import '../../../resources/ResourceImage.dart';
import '../../../resources/ResourceStrings.dart';
import '../../../util/view/system/SysAppBar.dart';
import '../../../util/view/system/SysRefreshIndicator.dart';
import 'HomeCategoryListTitle.dart';

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

  late Future<List<ProductAdsModel>> _lstAds;
  late Future<List<ProductCategoryModel>> _lstCategory;
  late Future<List<ProductGroupModel>> _lstGroupProduct;
  late String _title;

  @override
  void initState() {
    super.initState();

    initializeData();

    initializeView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SysAppBar(),
        body: SysRefreshIndicator(
            onRefresh: () async {
              initializeData();
            },
            child: SingleChildScrollView(
                child: Container(
                    color: hexToColor(ResourceColors.color_white),
                    child: Column(
                      children: [
                        // PageView top ads
                        buildProductAdsWidget(),
                        buildProductCategoryWidget(),
                        buildProductGroupWidget()
                      ],
                    )))));
  }

  /// buildProductAdsWidget
  Widget buildProductAdsWidget() {
    return SizedBox(
        height: 300,
        width: double.infinity,
        child: FutureBuilder(
            future: _lstAds,
            builder: (context, AsyncSnapshot<List<ProductAdsModel>?> snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox();
              } else {
                return SizedBox(
                  child: PageView.builder(
                      controller: _pageController,
                      physics: const ClampingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Image.network(snapshot.data![index].urlImage,
                            filterQuality: FilterQuality.medium, scale: 0.1, fit: BoxFit.cover);
                      }),
                );
              }
            }));
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
                child: FutureBuilder(
                    future: _lstGroupProduct,
                    builder: (context, AsyncSnapshot<List<ProductGroupModel>?> snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox();
                      } else {
                        return SizedBox(
                          child: ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return HomeProductGroupListTitle(model: snapshot.data![index]);
                              }),
                        );
                      }
                    })));
  }

  void initializeView() {
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

  void initializeData() {
    setState(() {
      _lstAds = ProductAdsResponse().fetchData();
      _lstCategory = ProductCategoriesResponse().fetchData();
      _lstGroupProduct = ProductGroupsResponse().fetchData();
    });
  }
}
