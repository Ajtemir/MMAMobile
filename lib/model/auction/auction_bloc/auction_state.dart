import 'package:equatable/equatable.dart';
import 'package:upai_app/model/auction/auction_detail_model.dart';

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

class SellerProductNotAuctioned extends BaseDetailAuctionState {
  SellerProductNotAuctioned(AuctionDetailModel detail) : super(detail);
}

class SellerProductAuctioned extends BaseDetailAuctionState {
  SellerProductAuctioned(AuctionDetailModel detail) : super(detail);
}

class BuyerAuctionApplied extends BaseDetailAuctionState {
  BuyerAuctionApplied(AuctionDetailModel detail) : super(detail);
}

class BuyerAuctionNotApplied extends BaseDetailAuctionState {
  BuyerAuctionNotApplied(AuctionDetailModel detail) : super(detail);
}

class BuyerProductNotAuctioned extends BaseAuctionState {}

class AuctionLoading extends BaseAuctionState {}

class AuctionError extends BaseAuctionState {}