class BannerModel {
  int id;
  String image;
  String category;
  String product;

  BannerModel({
    this.product,
    this.id,
    this.image,
    this.category,
  });

  BannerModel.fromJson(
    Map<String, dynamic> json,
  ) {
    id = json["id"];
    image = json["image"];
    category = json["category"];
    product = json["product"];
  }
}
