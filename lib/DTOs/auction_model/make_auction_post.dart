class MakingAuctionProduct {
  final DateTime startDate;
  final DateTime endDate;
  final int productId;
  final String email;
  final double startAuctionPrice;

  MakingAuctionProduct(
      {required this.startDate,
      required this.endDate,
      required this.productId,
      required this.email,
      required this.startAuctionPrice});
  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'sellerEmail': email,
      'startPrice': startAuctionPrice,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }
}
