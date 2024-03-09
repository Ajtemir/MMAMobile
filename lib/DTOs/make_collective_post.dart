class MakingCollectiveProduct{
  final DateTime startDate;
  final DateTime endDate;
  final int productId;
  final String email;
  final double groupDiscountPrice;
  final int minBuyerCount;

  MakingCollectiveProduct({required this.startDate, required this.endDate, required this.productId, required this.email, required this.groupDiscountPrice, required this.minBuyerCount});
  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'sellerEmail': email,
      'groupDiscountPrice': groupDiscountPrice,
      'buyerAmount': minBuyerCount,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }
}