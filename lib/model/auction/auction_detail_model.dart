import 'package:flutter/material.dart';

class AuctionDetailModel{
    final DateTime startDate;
    final DateTime endDate;
    final double startPrice;
    late final double? currentMaxPrice;

  AuctionDetailModel(this.startDate, this.endDate, this.startPrice, {this.currentMaxPrice});

  List<Widget> get widgets => [
    Text(startDate.toString()),
    Text(endDate.toString()),
    Text(currentMaxPrice.toString()),
    Text(startPrice.toString())];

  AuctionDetailModel.fromJson(Map<String, dynamic> json) :
      endDate =DateTime.parse(json['endDate']),
      currentMaxPrice = json['currentMaxPrice'],
      startDate = DateTime.parse(json['startDate']),
      startPrice = json['startPrice'];

}