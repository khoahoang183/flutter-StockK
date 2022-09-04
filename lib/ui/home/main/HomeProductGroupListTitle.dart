import 'package:flutter/material.dart';
import 'package:stockk_flutter/model/ProductGroupModel.dart';
import 'package:stockk_flutter/model/ProductModel.dart';
import 'package:stockk_flutter/resources/ResourceColors.dart';
import 'package:stockk_flutter/resources/ResourceStrings.dart';

import '../../../resources/ResourceDimens.dart';
import '../../../resources/ResourceImage.dart';

class HomeProductGroupListTitle extends StatelessWidget {
  final ProductGroupModel model;
  final double childListHeight = 270;

  // ignore: use_key_in_widget_constructors
  const HomeProductGroupListTitle({Key? key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 120,
        child: Column(
          children: [
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
            Container(
              height: childListHeight,
              child: ListView.builder(
                  itemCount: model.childList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return HomeProductChildListTitle(model: model.childList[index]);
                  }),
            )
          ],
        ));
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
        margin: const EdgeInsets.fromLTRB(0, 5, 10, 5),
        decoration: BoxDecoration(
            color: hexToColor(ResourceColors.color_white),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 2 // changes position of shadow
                  ),
            ],
            border: Border.all(color: hexToColor(ResourceColors.color_text_gray_11))),
        child: Container(
            width: imgSize,
            margin: const EdgeInsets.symmetric(horizontal: ResourceDimens.margin_5, vertical: ResourceDimens.margin_15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    model.urlImage,
                    width: imgSize,
                    height: imgSize,
                    fit: BoxFit.cover,
                    scale: 0.5,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, ResourceDimens.padding_10, 0, 0),
                    child: Text(
                      model.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: ResourceDimens.text_size_12, fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(ResourceDimens.margin_0, ResourceDimens.margin_10,
                        ResourceDimens.margin_0, ResourceDimens.margin_5),
                    child: Text(
                      maxLines: 1,
                      ResourceStrings.home_screen_lowest_ask,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 2,
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
                    padding: const EdgeInsets.all(5),
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
