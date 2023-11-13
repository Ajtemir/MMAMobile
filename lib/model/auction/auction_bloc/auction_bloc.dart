import 'package:upai_app/model/auction/auction_bloc/Events/base_auction_event.dart';
import 'package:upai_app/model/auction/auction_bloc/api/auction_api.dart';
import 'package:upai_app/model/auction/auction_bloc/auction_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auction_state.dart';

class AuctionBloc extends Bloc<BaseAuctionEvent, BaseAuctionState> {
  AuctionBloc(initialState) : super(initialState) {
    on<InitialRenderingAuctionEvent>((event, emit){
      switch(event.state){
        case AuctionState.sellerMadeAuction:
          emit(SellerProductAuctionedState());
          break;
        case AuctionState.sellerUnmadeAuction:
          emit(SellerProductNotAuctionedState());
          break;
        case AuctionState.buyerApply:
          emit(BuyerAuctionAppliedState(event.detail));
          break;
        case AuctionState.buyerUnapply:
          emit(BuyerAuctionNotAppliedState());
          break;
        case AuctionState.notMadeAuctioned:
          emit(BuyerProductNotAuctionedState());
          break;
      }
    });

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

    on<AuctionAppliedEvent>((event, emit) => emit(BuyerAuctionAppliedState(event.detail)));
    on<AuctionDenyEvent>((event, emit) => emit(BuyerProductNotAuctionedState()));
  }
}