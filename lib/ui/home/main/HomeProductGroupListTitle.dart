import 'package:flutter/material.dart';
import 'package:stockk_flutter/model/ProductModel.dart';
import 'package:stockk_flutter/resources/ResourceColors.dart';
import 'package:stockk_flutter/resources/ResourceStrings.dart';

import '../../../resources/ResourceDimens.dart';
import '../../../resources/ResourceImage.dart';

class HomeProductGroupListTitle extends StatelessWidget {
  final ProductModel model;

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
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        model.name,
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
                height: 200,
                child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HomeProductChildListTitle(model: model);
                    }))
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
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 10, 5),
      decoration: BoxDecoration(
          color: hexToColor(ResourceColors.color_white),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 1, blurRadius: 5 // changes position of shadow
                ),
          ],
          border: Border.all(color: hexToColor(ResourceColors.color_text_gray_2))),
      child: Expanded(
          child: SizedBox(
        width: 120,
        child: Column(
          children: [
            Image.asset(
              "${ResourceImages.AssetsPrefix}img_sneaker_yeezy.png",
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              scale: 0.5,
            ),
            Expanded(
                child: Text(
              model.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: ResourceDimens.text_size_12, fontWeight: FontWeight.bold),
            )),
            Text(
              "Lowest ask",
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(fontSize: ResourceDimens.text_size_12, color: hexToColor(ResourceColors.color_text_gray_2)),
            ),
            const Text(
              "\$199.0",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: ResourceDimens.text_size_18, fontWeight: FontWeight.bold),
            ),
            Container(
                color: hexToColor(ResourceColors.color_text_gray_2),
                padding: const EdgeInsets.all(5),
                child: const Text(
                  "100 SOLD",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: ResourceDimens.text_size_12),
                ))
          ],
        ),
      )),
    );
  }
}
