import 'package:upai_app/model/auction/auction_bloc/Events/base_auction_event.dart';
import 'package:upai_app/model/auction/auction_bloc/api/auction_api.dart';
import 'package:upai_app/model/auction/auction_bloc/auction_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuctionBloc extends Bloc<BaseAuctionEvent, BaseAuctionState> {
  AuctionBloc(initialState) : super(initialState) {
    on<InitialRenderingAuctionEvent>((event, emit) => emit(AuctionInitialState(event.detail)));

    on<AuctionMadeEvent>((event, emit) async {
      try {
        emit(AuctionLoadingState());
        await AuctionApi.makeAuctioned(event.productId, event.email);
        emit(SellerProductAuctionedState());
      }
      catch (e){
        emit(AuctionErrorState());
      }
    });


    on<AuctionUnmadeEvent>((event, emit) async {
      try {
        emit(AuctionLoadingState());
        await AuctionApi.unmakeAuctioned(event.productId, event.email);
        emit(SellerProductNotAuctionedState());
      }
      catch (e){
        emit(AuctionErrorState());
      }
    });

    on<AuctionAppliedEvent>((event, emit) => emit(BuyerAuctionAppliedState()));
    on<AuctionDenyEvent>((event, emit) => emit(BuyerProductNotAuctionedState()));
  }
}