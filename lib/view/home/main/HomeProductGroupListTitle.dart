import 'package:flutter/material.dart';
import 'package:stockk_flutter/model/ProductGroupModel.dart';
import 'package:stockk_flutter/model/ProductModel.dart';
import 'package:stockk_flutter/resources/ResourceColors.dart';
import 'package:stockk_flutter/resources/ResourceStrings.dart';

import '../../../resources/ResourceDimens.dart';
import '../../../resources/ResourceImage.dart';
import '../../../util/view/custom/CusBoxDecoration.dart';

class HomeProductGroupListTitle extends StatelessWidget {
  final ProductGroupModel model;
  final double childListItemHeight = 270;
  final double childListImageHeight = 100;
  final double childListAdsHeight = 250;

  // ignore: use_key_in_widget_constructors
  const HomeProductGroupListTitle({Key? key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: buildChildWidget(),
    );
  }

  Widget buildChildWidget() {
    switch (model.viewCategory) {
      case 1: // List Product
        return Column(children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      model.groupTitle,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: ResourceDimens.text_size_16, fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      ResourceStrings.home_screen_see_more,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: ResourceDimens.text_size_12,
                          fontWeight: FontWeight.bold,
                          color: hexToColor(ResourceColors.color_green_main)),
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Image.asset(
                    width: 18,
                    height: 18,
                    "${ResourceImages.AssetsPrefix}icon_arrow.png",
                    fit: BoxFit.cover,
                    color: hexToColor(ResourceColors.color_green_main),
                    scale: 0.1,
                  ))
            ],
          ),
          SizedBox(
              height: childListItemHeight,
              child: ListView.builder(
                  itemCount: model.childList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return HomeProductChildListTitle(model: model.childList[index]);
                  }))
        ]);
      case 2:
        return Column(children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: ResourceDimens.dimen_15),
                    child: Text(
                      model.groupTitle,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: ResourceDimens.text_size_16, fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
          SizedBox(
              height: childListImageHeight,
              child: ListView.builder(
                  itemCount: model.childList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return HomeProductChildImageListTitle(model: model.childList[index]);
                  }))
        ]);
      case 3: // Ads Image
        return Wrap(children: [HomeProductChildAdsTitle(model: model.childList[0])]);
      default:
        return const SizedBox.shrink();
    }
  }
}

class HomeProductChildListTitle extends StatelessWidget {
  final ProductModel model;

  // ignore: use_key_in_widget_constructors
  const HomeProductChildListTitle({Key? key, required this.model});

  @override
  Widget build(BuildContext context) {
    double imgSize = 100;
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(
            ResourceDimens.dimen_5, ResourceDimens.dimen_5, ResourceDimens.dimen_10, ResourceDimens.dimen_5),
        decoration: buildCusBoxDecorationShadow(),
        child: Container(
            width: imgSize,
            margin: const EdgeInsets.symmetric(horizontal: ResourceDimens.dimen_5, vertical: ResourceDimens.dimen_15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(ResourceDimens.dimen_10),
                  child: Image.network(
                    model.urlImage,
                    width: imgSize,
                    height: imgSize,
                    filterQuality: FilterQuality.medium,
                    fit: BoxFit.cover,
                    scale: 0.5,
                  ),
                ),
                SizedBox(
                    height: ResourceDimens.view_height_40,
                    child: Text(
                      model.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: ResourceDimens.text_size_12, fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, ResourceDimens.dimen_5, 0, ResourceDimens.dimen_5),
                    child: Text(
                      maxLines: 1,
                      ResourceStrings.home_screen_lowest_ask,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1,
                          fontSize: ResourceDimens.text_size_12,
                          color: hexToColor(ResourceColors.color_text_gray_2)),
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      "\$${model.price}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: ResourceDimens.text_size_18, fontWeight: FontWeight.bold),
                    )),
                Container(
                    color: hexToColor(ResourceColors.color_text_gray_10),
                    padding: const EdgeInsets.all(ResourceDimens.dimen_5),
                    child: Text(
                      "${model.soldCount} SOLD",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: ResourceDimens.text_size_12),
                    ))
              ],
            )),
      ),
    );
  }
}

class HomeProductChildImageListTitle extends StatelessWidget {
  final ProductModel model;

  // ignore: use_key_in_widget_constructors
  const HomeProductChildImageListTitle({Key? key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(ResourceDimens.dimen_5),
        child: Image.network(model.urlImage, filterQuality: FilterQuality.low, scale: 0.1, fit: BoxFit.cover),
      ),
    );
  }
}

class HomeProductChildAdsTitle extends StatelessWidget {
  final ProductModel model;

  // ignore: use_key_in_widget_constructors
  const HomeProductChildAdsTitle({Key? key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: ResourceDimens.dimen_10),
        child: Image.network(model.urlImage, filterQuality: FilterQuality.low, scale: 0.1, fit: BoxFit.cover),
      ),
    );
  }
}
