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
  int? price;
  int? categoryId;
  String? userId;
  String? sellerEmail;
  List<String>? images;

  ProductsModel(
      {this.id,
        this.description,
        this.price,
        this.categoryId,
        this.userId,
        this.sellerEmail,
        this.images});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    price = json['price'];
    categoryId = json['categoryId'];
    userId = json['userId'];
    sellerEmail = json['sellerEmail'];
    images = json['images'].cast<String>();
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
