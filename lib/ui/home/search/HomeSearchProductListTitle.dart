import 'package:flutter/material.dart';
import 'package:stockk_flutter/model/ProductModel.dart';

import '../../../resources/ResourceColors.dart';
import '../../../resources/ResourceDimens.dart';
import '../../../resources/ResourceStrings.dart';

class HomeSearchProductListTitle extends StatelessWidget {
  final ProductModel model;

  const HomeSearchProductListTitle({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
          ResourceDimens.dimen_0, ResourceDimens.dimen_5, ResourceDimens.dimen_10, ResourceDimens.dimen_5),
      decoration: BoxDecoration(
          color: hexToColor(ResourceColors.color_white),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 2 // changes position of shadow
                ),
          ],
          border: Border.all(color: hexToColor(ResourceColors.color_text_gray_11))),
      child: Container(
          margin: const EdgeInsets.all(ResourceDimens.dimen_5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  model.urlImage,
                  width: ResourceDimens.view_height_100,
                  height: ResourceDimens.view_height_100,
                  fit: BoxFit.cover,
                  scale: 0.5,
                ),
              )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(ResourceDimens.dimen_0, ResourceDimens.dimen_10,
                      ResourceDimens.dimen_0, ResourceDimens.dimen_0),
                  child: Text(
                    model.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: ResourceDimens.text_size_12, fontWeight: FontWeight.bold),
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(ResourceDimens.dimen_0, ResourceDimens.dimen_5,
                      ResourceDimens.dimen_0, ResourceDimens.dimen_5),
                  child: Text(
                    maxLines: 1,
                    ResourceStrings.home_screen_lowest_ask,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: ResourceDimens.text_size_12, color: hexToColor(ResourceColors.color_text_gray_2)),
                  )),
              Text(
                "\$${model.price}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: ResourceDimens.text_size_18, fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }
}
