import 'package:flutter/material.dart';

import '../../../resources/ResourceDimens.dart';
import '../../../resources/ResourceImage.dart';
import '../../../resources/ResourceStrings.dart';

class CusTopBarWidget extends StatefulWidget {
  const CusTopBarWidget(
      {Key? key,
      required this.onTapLeftImageCallback,
      required this.onTapRightImageCallback,
      required this.titleString,
      required this.urlLeftImage,
      required this.urlRightImage})
      : super(key: key);

  final VoidCallback onTapLeftImageCallback; // event click left image
  final VoidCallback onTapRightImageCallback; // event click right image

  final String urlLeftImage;
  final String urlRightImage;

  final String titleString; // center title

  @override
  // ignore: library_private_types_in_public_api
  _CusTopBarState createState() =>
      // ignore: no_logic_in_create_state
      _CusTopBarState();
}

class _CusTopBarState extends State<CusTopBarWidget> {
  _CusTopBarState();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ResourceDimens.view_toolbar_height,
      child: Padding(
        padding: const EdgeInsets.all(ResourceDimens.padding_20),
        child: Row(
          children: [
            GestureDetector(
              onTap: widget.onTapLeftImageCallback,
              child: Image.asset(
                  width: ResourceDimens.view_height_20, height: ResourceDimens.view_height_20, widget.urlLeftImage),
            ),
            Expanded(
                child: Text(widget.titleString,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: ResourceDimens.text_size_18,
                      fontWeight: FontWeight.bold,
                    ))),
            GestureDetector(
              onTap: widget.onTapRightImageCallback,
              child: Image.asset(
                  width: ResourceDimens.view_height_20, height: ResourceDimens.view_height_20, widget.urlRightImage),
            ),
          ],
        ),
      ),
    );
  }
}
