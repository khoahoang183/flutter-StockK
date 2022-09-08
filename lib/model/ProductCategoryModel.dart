import '../base/model/BaseModel.dart';

class ProductCategoryModel extends BaseModel {
  String urlImage = "";
  String urlDetail = "";
  String title = "";

  ProductCategoryModel() : super();

  ProductCategoryModel.withAllParams(int id, this.urlImage, this.urlDetail, this.title) : super.withAllParams(id);

  @override
  List<ProductCategoryModel> createDummyData() {
    return <ProductCategoryModel>[
      ProductCategoryModel.withAllParams(
          1, "https://i.pinimg.com/originals/0c/64/9a/0c649a17ec1e5f5ca340248b4ef4e4be.gif", "", "Sneaker"),
      ProductCategoryModel.withAllParams(2, "https://c.tenor.com/FjnLrLnMrCMAAAAC/meme-shrek.gif", "", "Apparel"),
      ProductCategoryModel.withAllParams(3, "https://c.tenor.com/dp_hQBGT0rIAAAAd/think-smart.gif", "", "Electronics"),
      ProductCategoryModel.withAllParams(
          4, "https://im.indiatimes.in/media/content/2019/Sep/blinking_guy_meme_1569407297.gif", "", "Trading Cards"),
      ProductCategoryModel.withAllParams(5, "https://media3.giphy.com/media/koUtwnvA3TY7C/200.gif", "", "Collectibles")
    ];
  }

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      "urlImage": urlImage,
      "urlDetail": urlDetail,
      "title": title,
    });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel.withAllParams(
      json["id"],
      json["urlImage"],
      json["urlDetail"],
      json["title"],
    );
  }
}
