import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:upai_app/model/auction/auction_detail_model.dart';

abstract class BaseAuctionState extends Equatable{
  @override
  List<Object?> get props => [];
}

abstract class BaseDetailAuctionState extends BaseAuctionState{
  final AuctionDetailModel detail;
  Widget build();


  BaseDetailAuctionState(this.detail);
  @override
  List<Object?> get props => [detail];
}

class AuctionInitialState extends BaseDetailAuctionState {
  AuctionInitialState(AuctionDetailModel detail) : super(detail);

  @override
  Widget build() {
    return Column(
      children: [
        Text(this.runtimeType.toString()),
        Text(detail.startDate.toString()),
        Text(detail.endDate.toString()),
        Text(detail.currentMaxPrice.toString()),
        Text(detail.startPrice.toString()),
      ],
    );
  }

}
class SellerProductNotAuctionedState extends BaseAuctionState {
}

class SellerProductAuctionedState extends BaseAuctionState {
}

class BuyerAuctionAppliedState extends BaseAuctionState {
}

class BuyerAuctionNotAppliedState extends BaseAuctionState {
}

class BuyerProductNotAuctionedState extends BaseAuctionState {}

class AuctionLoadingState extends BaseAuctionState {}

class AuctionErrorState extends BaseAuctionState {}