import 'package:equatable/equatable.dart';
import 'package:upai_app/model/auction/auction_detail_model.dart';

abstract class BaseAuctionEvent extends Equatable {
  const BaseAuctionEvent();
  @override
  List<Object?> get props => [];
}

abstract class BaseMakingAuctionEvent extends BaseAuctionEvent {
  final int productId;
  final String email;
  const BaseMakingAuctionEvent(this.productId, this.email);
  @override
  List<Object?> get props => [productId, email];
}

class InitialRenderingAuctionEvent extends BaseAuctionEvent {
  final AuctionDetailModel detail;

  const InitialRenderingAuctionEvent(this.detail);
}

class AuctionMadeEvent extends BaseMakingAuctionEvent {
  const AuctionMadeEvent(int productId, String email) : super(productId, email);
}
class AuctionUnmadeEvent extends BaseMakingAuctionEvent {
  const AuctionUnmadeEvent(int productId, String email) : super(productId, email);
}
class AuctionAppliedEvent extends BaseAuctionEvent {}
class AuctionDenyEvent extends BaseAuctionEvent {}