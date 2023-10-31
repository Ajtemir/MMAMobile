import 'package:upai_app/model/auction/auction_bloc/Events/base_auction_event.dart';
import 'package:upai_app/model/auction/auction_bloc/api/auction_api.dart';
import 'package:upai_app/model/auction/auction_bloc/auction_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuctionBloc extends Bloc<BaseAuctionEvent, BaseAuctionState> {
  AuctionBloc() : super(AuctionLoading()) {

    on((event, emit) => emit(AuctionLoading()));

    on<AuctionMadeEvent>((event, emit) async {
      try {
        await AuctionApi.makeAuctioned(event.productId, event.email);
        emit(SellerProductAuctioned());
      }
      catch (e){
        emit(AuctionError());
      }
    });


    on<AuctionUnmadeEvent>((event, emit) async {
      try {
        await AuctionApi.unmakeAuctioned(event.productId, event.email);
        emit(SellerProductNotAuctioned());
      }
      catch (e){
        emit(AuctionError());
      }
    });

    on<AuctionAppliedEvent>((event, emit) => emit(BuyerAuctionApplied()));
    on<AuctionDenyEvent>((event, emit) => emit(BuyerProductNotAuctioned()));
  }
}