import 'package:stockk_flutter/base/viewmodel/BaseViewModel.dart';

import '../../model/ProductModel.dart';
import '../../network/response/ProductSearchResponse.dart';

class HomeScreenSearchViewModel extends BaseViewModel {
  HomeScreenSearchViewModel(super.buildContext);

  late final _productSearchResponse = ProductSearchResponse();

  Future<List<ProductModel>> fetchProductSearch() async {
    return super.fetchAPIWithProgressingDialog<List<ProductModel>>(_productSearchResponse.fetchData);
  }
}
