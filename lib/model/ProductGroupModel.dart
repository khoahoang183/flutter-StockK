import 'package:stockk_flutter/base/BaseModel.dart';
import 'package:stockk_flutter/model/ProductModel.dart';

class ProductGroupModel extends BaseModel {
  String groupTitle = "";
  List<ProductModel> childList = <ProductModel>[];
  int viewCategory = 1;

  ProductGroupModel();

  ProductGroupModel.withAllParams(this.groupTitle, this.childList);

  @override
  List<ProductGroupModel> createDummyData() {
    return <ProductGroupModel>[
      ProductGroupModel.withAllParams("Popular Sneaker", ProductModel().createDummyData()),
      ProductGroupModel.withAllParams("Popular Brand", ProductModel().createDummyData()),
      ProductGroupModel.withAllParams("Featured Apparel", ProductModel().createDummyData()),
      ProductGroupModel.withAllParams("Popular Electronics", ProductModel().createDummyData()),
      ProductGroupModel.withAllParams("Featured Trading Cards", ProductModel().createDummyData())
    ];
  }
}
