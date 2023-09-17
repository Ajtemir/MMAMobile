class SubmitAuctionProduct {
  final DateTime startDate;
  final DateTime endDate;
  final int productId;
  final String email;
  final double startAuctionPrice;

  SubmitAuctionProduct(
      {required this.startDate,
      required this.endDate,
      required this.productId,
      required this.email,
      required this.startAuctionPrice});
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'sellerEmail': email,
      'startPrice': startAuctionPrice,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }
}
