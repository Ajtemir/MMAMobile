import 'package:upai_app/model/productModel.dart';

class AboutProductModel {
  bool? isFavorite;
  int? favoriteCount;
  int? id;
  String? description;
  double? price;
  int? categoryId;
  String? userId;
  String? sellerEmail;
  List<String>? images;
  CollectiveInfo? collectiveInfo;
  bool? isSetCollective;
  late bool isSeller;

  AboutProductModel({
    this.isFavorite,
    this.favoriteCount,
    this.id,
    this.description,
    this.price,
    this.categoryId,
    this.userId,
    this.sellerEmail,
    this.images,
    this.collectiveInfo,
    this.isSetCollective,
    required this.isSeller,
  });

  AboutProductModel.fromJson(Map<String, dynamic> jsonBody) {
    var json = jsonBody['data'];
    isFavorite = json['isFavorite'];
    favoriteCount = json['favoriteCount'];
    id = json['id'];
    description = json['description'];
    price = json['price'];
    categoryId = json['categoryId'];
    userId = json['userId'];
    sellerEmail = json['sellerEmail'];
    images = json['images'].cast<String>();
    collectiveInfo = json['collectiveInfo'] == null ? null : CollectiveInfo.fromJson(json['collectiveInfo']);
    isSetCollective = json['isSetCollective'];
    isSeller = json['isSeller'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isFavorite'] = this.isFavorite;
    data['favoriteCount'] = this.favoriteCount;
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
