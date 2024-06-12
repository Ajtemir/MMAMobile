import 'package:upai_app/model/auction/auction_bloc/Events/base_auction_event.dart';
import 'package:upai_app/model/auction/auction_bloc/api/auction_api.dart';
import 'package:upai_app/model/auction/auction_bloc/auction_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upai_app/model/auction/auction_detail_with_state_model.dart';
import '../auction_state.dart';

class AuctionBloc extends Bloc<BaseAuctionEvent, BaseAuctionState> {
  final int _productId;
  final String _email;
  static Future<BaseAuctionState> getInitialState(int productId, String email) async {
    AuctionDetailWithStateModel event = await AuctionApi.getAuctionDetail(productId, email);
    BaseAuctionState initial;
    switch(event.state){
    case AuctionState.sellerMadeAuction:
      initial = SellerProductAuctionedState(event.auctionDetail!);
    break;
    case AuctionState.sellerUnmadeAuction:
      initial = SellerProductNotAuctionedState();
    break;
    case AuctionState.buyerApply:
      initial = BuyerAuctionAppliedState(event.auctionDetail!);
    break;
    case AuctionState.buyerUnapply:
      initial = BuyerAuctionNotAppliedState(event.auctionDetail!);
    break;
    case AuctionState.notMadeAuctioned:
      initial = BuyerProductNotAuctionedState();
    break;
    default:
      initial = AuctionErrorState("Something went wrong");
          break;
    }
    return initial;
  }

  static Future<AuctionBloc> getAuctionBloc(String email, int productId) async {
    var state = await getInitialState(productId, email);
    return AuctionBloc( email, productId);
  }
  AuctionBloc(this._email, this._productId) : super(AuctionLoadingState()) {
    on<InitEvent>((event, emit) async {
      emit(await getInitialState(_productId, _email));
    });
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
        emit(BuyerAuctionAppliedState(response.auctionDetail!));
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
      catch (e, stackTrace){
        print(stackTrace);
        emit(AuctionErrorState(e.toString()));
      }

    });
  }
}