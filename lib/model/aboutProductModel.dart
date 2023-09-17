import 'auction_model.dart';

class AboutProductModel {
  int? id;
  String? description;
  double? price;
  int? categoryId;
  String? categoryName;
  String? userId;
  String? sellerEmail;
  List<String>? images;
  CollectiveInfo? collectiveInfo;
  bool? isSetCollective;
  int? favoriteCount;
  bool? isFavorite;
  bool? isSeller;
  int? auctionState;
  AuctionModel? auctionDetail;

  AboutProductModel(
      {this.id,
      this.description,
      this.price,
      this.categoryId,
      this.categoryName,
      this.userId,
      this.sellerEmail,
      this.images,
      this.collectiveInfo,
      this.isSetCollective,
      this.favoriteCount,
      this.isFavorite,
      this.isSeller,
      this.auctionState,
      this.auctionDetail});

  AboutProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    price = json['price'];
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    userId = json['userId'];
    sellerEmail = json['sellerEmail'];
    images = json['images'].cast<String>();
    collectiveInfo = json['collectiveInfo'] != null
        ? CollectiveInfo.fromJson(json['collectiveInfo'])
        : null;
    isSetCollective = json['isSetCollective'];
    favoriteCount = json['favoriteCount'];
    isFavorite = json['isFavorite'];
    isSeller = json['isSeller'];
    auctionState = json['auctionState'] ?? 4;
    auctionDetail = json['auctionDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['price'] = price;
    data['categoryId'] = categoryId;
    data['categoryName'] = categoryName;
    data['userId'] = userId;
    data['sellerEmail'] = sellerEmail;
    data['images'] = images;
    if (collectiveInfo != null) {
      data['collectiveInfo'] = collectiveInfo!.toJson();
    }
    data['isSetCollective'] = isSetCollective;
    data['favoriteCount'] = favoriteCount;
    data['isFavorite'] = isFavorite;
    data['isSeller'] = isSeller;
    data['auctionState'] = auctionState;
    data['auctionDetail'] = auctionDetail;
    return data;
  }
}

class CollectiveInfo {
  int? currentBuyerCount;
  double? discountedPrice;
  int? minBuyerCount;
  DateTime? startDate;
  DateTime? endDate;

  CollectiveInfo(
      {this.currentBuyerCount,
      this.discountedPrice,
      this.minBuyerCount,
      this.startDate,
      this.endDate});

  CollectiveInfo.fromJson(Map<String, dynamic> json) {
    currentBuyerCount = json['currentBuyerCount'];
    discountedPrice = json['discountedPrice'];
    minBuyerCount = json['minBuyerCount'];
    startDate = DateTime.parse(json['startDate']);
    endDate = DateTime.parse(json['endDate']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentBuyerCount'] = currentBuyerCount;
    data['discountedPrice'] = discountedPrice;
    data['minBuyerCount'] = minBuyerCount;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    return data;
  }
}
