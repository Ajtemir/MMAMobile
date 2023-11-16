import 'package:upai_app/model/auction/auction_bloc/Events/base_auction_event.dart';
import 'package:upai_app/model/auction/auction_bloc/api/auction_api.dart';
import 'package:upai_app/model/auction/auction_bloc/auction_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auction_state.dart';

class AuctionBloc extends Bloc<BaseAuctionEvent, BaseAuctionState> {
  final int _productId;
  final String _email;
  AuctionBloc(initialState, this._email, this._productId) : super(initialState) {
    on<InitialRenderingAuctionEvent>((event, emit){
      switch(event.state){
        case AuctionState.sellerMadeAuction:
          emit(SellerProductAuctionedState(event.detail!));
          break;
        case AuctionState.sellerUnmadeAuction:
          emit(SellerProductNotAuctionedState());
          break;
        case AuctionState.buyerApply:
          emit(BuyerAuctionAppliedState(event.detail!));
          break;
        case AuctionState.buyerUnapply:
          emit(BuyerAuctionNotAppliedState(event.detail!));
          break;
        case AuctionState.notMadeAuctioned:
          emit(BuyerProductNotAuctionedState());
          break;
      }
    });

    on<AuctionMadeEvent>((event, emit) async {
      try {
        emit(AuctionLoadingState());
        await AuctionApi.makeAuctioned(_productId, _email, event.detail);
        emit(SellerProductAuctionedState(event.detail));
      }
      catch (e){
        emit(AuctionErrorState(e.toString()));
      }
    });


    on<AuctionUnmadeEvent>((event, emit) async {
      try {
        emit(AuctionLoadingState());
        await AuctionApi.unmakeAuctioned(_productId, _email);
        emit(SellerProductNotAuctionedState());
      }
      catch (e){
        emit(AuctionErrorState(e.toString()));
      }
    });

    on<AuctionAppliedEvent>((event, emit) async {
      try {
        emit(AuctionLoadingState());
        await AuctionApi.applyAuctioned(_productId, _email, event.suggestedPrice);
        var response = await AuctionApi.getAuctionDetail(_productId, _email);
        emit(BuyerAuctionAppliedState(response.auctionDetail));
      }
      catch (e){
        emit(AuctionErrorState(e.toString()));
      }
    });
    on<AuctionDenyEvent>((event, emit) => emit(BuyerProductNotAuctionedState()));
    on<AuctionSubmitEvent>((event, emit) async {
      try {
        emit(AuctionLoadingState());
        await AuctionApi.submitAuction(_productId, _email);
        emit(SellerProductNotAuctionedState());
      }
      catch (e){
        emit(AuctionErrorState(e.toString()));
      }

    });
  }
}