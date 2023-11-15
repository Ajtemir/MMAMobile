import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:upai_app/model/auction/auction_detail_model.dart';

import '../auction_state.dart';

abstract class BaseAuctionState extends Equatable{
  @override
  List<Object?> get props => [];
}

abstract class BaseDetailAuctionState extends BaseAuctionState{
  final AuctionDetailModel detail;


  BaseDetailAuctionState(this.detail);
  @override
  List<Object?> get props => [detail];
}

class AuctionInitialState extends BaseDetailAuctionState {
  final AuctionState state;
  AuctionInitialState(AuctionDetailModel detail, this.state) : super(detail);



}
class SellerProductNotAuctionedState extends BaseAuctionState {
}

class SellerProductAuctionedState extends BaseDetailAuctionState {
  SellerProductAuctionedState(AuctionDetailModel detail) : super(detail);

}

class BuyerAuctionAppliedState extends BaseDetailAuctionState {
  BuyerAuctionAppliedState(AuctionDetailModel detail) : super(detail);
}

class BuyerAuctionNotAppliedState extends BaseDetailAuctionState {
  BuyerAuctionNotAppliedState(AuctionDetailModel detail) : super(detail);
}

class BuyerProductNotAuctionedState extends BaseAuctionState {}

class AuctionLoadingState extends BaseAuctionState {}

class AuctionErrorState extends BaseAuctionState {
  final String errorMessage;

  AuctionErrorState(this.errorMessage);
}