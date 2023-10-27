import 'package:equatable/equatable.dart';

abstract class BaseAuctionEvent extends Equatable {
  const BaseAuctionEvent();
  @override
  List<Object?> get props => [];
}

class AuctionMadeEvent extends BaseAuctionEvent {}
class AuctionUnmadeEvent extends BaseAuctionEvent {}
class AuctionAppliedEvent extends BaseAuctionEvent {}
class AuctionDenyEvent extends BaseAuctionEvent {}