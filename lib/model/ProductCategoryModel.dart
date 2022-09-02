import '../base/BaseModel.dart';

class ProductCategoryModel extends BaseModel {
  String urlImage = "";
  String urlDetail = "";
  String title = "";

  ProductCategoryModel();

  ProductCategoryModel.withAllParams(this.urlImage, this.urlDetail, this.title);

  @override
  List<ProductCategoryModel> createDummyData() {
    return <ProductCategoryModel>[
      ProductCategoryModel.withAllParams(
          "https://i.pinimg.com/originals/0c/64/9a/0c649a17ec1e5f5ca340248b4ef4e4be.gif", "", "Sneaker"),
      ProductCategoryModel.withAllParams("https://c.tenor.com/FjnLrLnMrCMAAAAC/meme-shrek.gif", "", "Apparel"),
      ProductCategoryModel.withAllParams("https://c.tenor.com/dp_hQBGT0rIAAAAd/think-smart.gif", "", "Electronics"),
      ProductCategoryModel.withAllParams(
          "https://im.indiatimes.in/media/content/2019/Sep/blinking_guy_meme_1569407297.gif", "", "Trading Cards"),
      ProductCategoryModel.withAllParams("https://media3.giphy.com/media/koUtwnvA3TY7C/200.gif", "", "Collectibles")
    ];
  }
}
