import 'package:flutter/material.dart';

Image buildCusImageNetwork(String urlImage, {filterQuality = FilterQuality.medium, fit = BoxFit.cover, scale = 0.1}) =>
    Image.network(urlImage, filterQuality: filterQuality, fit: fit, scale: scale);
