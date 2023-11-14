import 'package:equatable/equatable.dart';
import 'package:upai_app/model/auction/auction_detail_model.dart';
import 'package:upai_app/model/auction/auction_state.dart';

abstract class BaseAuctionEvent extends Equatable {
  const BaseAuctionEvent();
  @override
  List<Object?> get props => [];
}

abstract class BaseDetailAuctionEvent extends BaseAuctionEvent {
  final AuctionDetailModel detail;

  const BaseDetailAuctionEvent(this.detail);
}

abstract class BaseMakingAuctionEvent extends BaseAuctionEvent {
  final int productId;
  final String email;
  const BaseMakingAuctionEvent(this.productId, this.email);
  @override
  List<Object?> get props => [productId, email];
}

abstract class BaseDetailMakingAuctionEvent extends BaseMakingAuctionEvent {
  final AuctionDetailModel detail;
  const BaseDetailMakingAuctionEvent(int productId, String email, this.detail) : super(productId, email);

}

class InitialRenderingAuctionEvent extends BaseAuctionEvent {
  final AuctionDetailModel? detail;
  final AuctionState state;

  const InitialRenderingAuctionEvent(this.detail, this.state);
}

class AuctionMadeEvent extends BaseDetailAuctionEvent {
  const AuctionMadeEvent(AuctionDetailModel detail) : super(detail);
}
class AuctionUnmadeEvent extends BaseMakingAuctionEvent {
  const AuctionUnmadeEvent(int productId, String email) : super(productId, email);
}
class AuctionAppliedEvent extends BaseDetailAuctionEvent {
  const AuctionAppliedEvent(AuctionDetailModel detail) : super(detail);
}
class AuctionDenyEvent extends BaseAuctionEvent {}