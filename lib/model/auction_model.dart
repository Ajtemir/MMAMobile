class AuctionModel {
  double? startPrice;
  double? currentMaxPrice;
  DateTime? startDate;
  DateTime? endDate;

  AuctionModel(
      {this.startPrice, this.currentMaxPrice, this.startDate, this.endDate});

  AuctionModel.fromJson(Map<String, dynamic> json) {
    startPrice = json['startPrice'];
    currentMaxPrice = json['currentMaxPrice'];
    startDate = json['startDate'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startPrice'] = startPrice;
    data['currentMaxPrice'] = currentMaxPrice;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    return data;
  }
}
