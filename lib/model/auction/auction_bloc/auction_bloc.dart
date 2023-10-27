import 'package:upai_app/model/auction/auction_bloc/Events/base_auction_event.dart';
import 'package:upai_app/model/auction/auction_bloc/auction_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuctionBloc extends Bloc<BaseAuctionEvent, BaseAuctionState> {
  AuctionBloc() : super(AuctionLoading()) {

    on<AuctionMadeEvent>((event, emit) => emit(SellerProductAuctioned()));
    on<AuctionUnmadeEvent>((event, emit) => emit(SellerProductNotAuctioned()));
    on<AuctionAppliedEvent>((event, emit) => emit(BuyerAuctionApplied()));
    on<AuctionDenyEvent>((event, emit) => emit(BuyerProductNotAuctioned()));
    on((event, emit) => emit(AuctionLoading()));
  }
}