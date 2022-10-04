import 'package:stockk_flutter/base/viewmodel/BaseViewModel.dart';
import 'package:stockk_flutter/model/AuthModel.dart';
import 'package:stockk_flutter/network/response/AuthLoginResponse.dart';

import '../../model/ProductModel.dart';
import '../../network/response/ProductSearchResponse.dart';

class HomeScreenUserViewModel extends BaseViewModel {
  HomeScreenUserViewModel(super.buildContext);

  late final _authLoginResponse = AuthLoginResponse();

  Future<AuthModel> fetchAuthModel() async {
    return super.fetchAPIWithProgressingDialog<AuthModel>(_authLoginResponse.fetchData);
  }
}
