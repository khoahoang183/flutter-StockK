import '../base/model/BaseModel.dart';

class ProductCategoryModel extends BaseModel {
  String urlImage = "";
  String urlDetail = "";
  String title = "";

  @override
  ProductCategoryModel() : super();

  @override
  ProductCategoryModel.withAllParams(int id, this.urlImage, this.urlDetail, this.title) : super.withAllParams(id);

  @override
  List<ProductCategoryModel> createDummyData() {
    return <ProductCategoryModel>[
      ProductCategoryModel.withAllParams(1, "https://tinyurl.com/categoryimg1", "", "Sneaker"),
      ProductCategoryModel.withAllParams(2, "https://tinyurl.com/categoryimg1", "", "Apparel"),
      ProductCategoryModel.withAllParams(3, "https://tinyurl.com/categoryimg1", "", "Electronics"),
      ProductCategoryModel.withAllParams(4, "https://tinyurl.com/categoryimg1", "", "Trading Cards"),
      ProductCategoryModel.withAllParams(5, "https://tinyurl.com/categoryimg1", "", "Collectibles")
    ];
  }

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      "urlImage": urlImage,
      "urlDetail": urlDetail,
      "title": title,
    });

  @override
  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel.withAllParams(
      json["id"],
      json["urlImage"],
      json["urlDetail"],
      json["title"],
    );
  }
}
