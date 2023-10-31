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

class SellerProductNotAuctioned extends BaseAuctionState {
}

class SellerProductAuctioned extends BaseAuctionState {
}

class BuyerAuctionApplied extends BaseAuctionState {
}

class BuyerAuctionNotApplied extends BaseAuctionState {
}

class BuyerProductNotAuctioned extends BaseAuctionState {}

class AuctionLoading extends BaseAuctionState {}

class AuctionError extends BaseAuctionState {}