class AuctionDetailModel{
    final DateTime startDate;
    final DateTime endDate;
    final double startPrice;
    late final double? currentMaxPrice;

  AuctionDetailModel(this.startDate, this.endDate, this.startPrice, this.currentMaxPrice);

  AuctionDetailModel.fromJson(Map<String, dynamic> json) :
      endDate =DateTime.parse(json['endDate']),
      currentMaxPrice = json['currentMaxPrice'],
      startDate = DateTime.parse(json['startDate']),
      startPrice = json['startPrice'];

}