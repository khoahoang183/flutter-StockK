import 'package:stockk_flutter/base/viewmodel/BaseViewModel.dart';
import 'package:stockk_flutter/model/AuthModel.dart';
import 'package:stockk_flutter/network/response/AuthLoginResponse.dart';

import '../../util/helper/PreferenceHelper.dart';

class HomeScreenUserViewModel extends BaseViewModel {
  HomeScreenUserViewModel(super.buildContext);

  late final _authLoginResponse = AuthLoginResponse();

  String accessToken = "";

  Future<String> loginFunction(String username, String password) async {
    //Future<AuthModel> result;
    super.fetchAPIWithProgressingDialog<AuthModel>(_authLoginResponse.fetchData);
    /*_authLoginResponse.fetchData(postData: {"username": username, "password": password}).then((value) => {
    // insert to PreferenceHelper
    PreferenceHelper.setString(PreferenceHelper.PREF_KEY_USER_TOKEN_CACHE, value.accessToken),
    accessToken = value.accessToken,
        return value.accessToken
    })*/
    return "";
  }

  void getAccessToken() {
    accessToken = PreferenceHelper.getString(PreferenceHelper.PREF_KEY_USER_TOKEN_CACHE);
  }
}
