class UnmakeAuction {
  String? sellerEmail;
  int? productId;

  UnmakeAuction({this.sellerEmail, this.productId});

  UnmakeAuction.fromJson(Map<String, dynamic> json) {
    sellerEmail = json['sellerEmail'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sellerEmail'] = sellerEmail;
    data['productId'] = productId;
    return data;
  }
}
