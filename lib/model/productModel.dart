class ListProductsModel {
  List<ProductsModel>? data;

  ListProductsModel({this.data});

  ListProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProductsModel>[];
      json['data'].forEach((v) {
        data!.add(new ProductsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductsModel {
  int? id;
  String? description;
  double? price;
  int? categoryId;
  String? userId;
  String? sellerEmail;
  List<String>? images;
  CollectiveInfo? collectiveInfo;

  ProductsModel({
        this.id,
        this.description,
        this.price,
        this.categoryId,
        this.userId,
        this.sellerEmail,
        this.images,
        this.collectiveInfo,
      });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    price = json['price'];
    categoryId = json['categoryId'];
    userId = json['userId'];
    sellerEmail = json['sellerEmail'];
    images = json['images'].cast<String>();
    collectiveInfo = json['collectiveInfo'] == null ? null : CollectiveInfo.fromJson(json['collectiveInfo']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['price'] = this.price;
    data['categoryId'] = this.categoryId;
    data['userId'] = this.userId;
    data['sellerEmail'] = this.sellerEmail;
    data['images'] = this.images;
    return data;
  }
}

class CollectiveInfo {
  final int minBuyerCount;
  final int currentBuyerCount;
  final int collectivePrice;
  final DateTime startDate;
  final DateTime endDate;
  CollectiveInfo(this.minBuyerCount, this.currentBuyerCount, this.collectivePrice, this.startDate, this.endDate);
  static CollectiveInfo fromJson(Map<String, dynamic> json) =>
      CollectiveInfo(json['minBuyerCount'], json['currentBuyerCount'], json['discountedPrice'], DateTime.parse(json['startDate']), DateTime.parse(json['endDate']));

}
