import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/BaseResponseModel.dart';

/// fetch Data from url API
Future<T?> fetchData<T>(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    /// Call API success
    return BaseResponseModel<T>.fromJson(jsonDecode(response.body)).data;

  } else {
    /// Call API failed
    return null;
  }
}
