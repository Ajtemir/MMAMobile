import 'package:upai_app/bloc/reduction_bloc/reduction_detail_model.dart';
import 'package:upai_app/bloc/reduction_bloc/reduction_detail_with_state_model.dart';
import 'package:upai_app/bloc/reduction_bloc/states/buyer_product_not_reductioned_state.dart';
import 'package:upai_app/bloc/reduction_bloc/states/reduction_loading_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upai_app/bloc/reduction_bloc/states/seller_product_reductioned_state.dart';
import 'package:upai_app/bloc/reduction_bloc/states/seller_not_reductioned_state.dart';
import 'package:upai_app/utilities/app_http_client.dart';

import '../../model/auction/auction_bloc/api/execute_result.dart';
import 'reduction_event.dart';
import 'states/base_reduction_state.dart';
import 'reduction_state_enum.dart';
import 'states/buyer_reduction_applied_state.dart';
import 'states/buyer_reduction_not_applied_state.dart';
import 'states/reduction_error_state.dart';

class ReductionBloc extends Bloc<BaseReductionEvent, BaseReductionState> {
  final int productId;
  

  ReductionBloc(this.productId) : super(ReductionLoadingState()) {
    on<InitReductionEvent>((event, emit) async {
      emit(await getInitialState(productId));
    });

    on<ReductionMakeEvent>((event, emit) async {
      try {
        emit(ReductionLoadingState());
        AppHttpClient.execute(HttpMethod.post, '/Reduction/Make', {
          'productId': productId,
          'startDate': event.detail.startDate.toIso8601String(),
          'endDate': event.detail.endDate.toIso8601String(),
          'startPrice': event.detail.startPrice,
        });
        emit(SellerProductReductionedState(event.detail));
      }
      catch (e){
        emit(ReductionErrorState(e.toString()));
      }
    });


    on<ReductionUnmakeEvent>((event, emit) async {
      try {
        emit(ReductionLoadingState());
        AppHttpClient.execute(HttpMethod.post, '/Reduction/Unmake', {
          'productId': productId,
        });
        emit(SellerNotReductionedState());
      }
      catch (e){
        emit(ReductionErrorState(e.toString()));
      }
    });

    on<ReductionApplyEvent>((event, emit) async {
      try {
        emit(ReductionLoadingState());
        await AppHttpClient.execute(HttpMethod.post, '/Reduction/Apply', {
          'productId': productId,
          'suggestedPrice': event.suggestedPrice
        });
        ExecuteResult<ReductionDetailWithStateModel> response = await AppHttpClient.execute(HttpMethod.get, '/Reduction/Get', {'productId': productId,},dataConstructor: ReductionDetailWithStateModel.fromJson);
        emit(BuyerReductionAppliedState(response.single!.reductionDetail!));
      }
      catch (e){
        emit(ReductionErrorState(e.toString()));
      }
    });

    on<ReductionDenyEvent>((event, emit) async {
      try {
        emit(ReductionLoadingState());
        await AppHttpClient.execute(HttpMethod.post, '/Reduction/Deny', {'productId': productId,});
        emit(BuyerProductNotReductionedState());
      }
      catch (e){
        emit(ReductionErrorState(e.toString()));
      }
    });

    on<ReductionSubmitEvent>((event, emit) async {
      try {
        emit(ReductionLoadingState());
        await AppHttpClient.execute(HttpMethod.post, '/Reduction/Submit', {'productId': productId,});
        emit(SellerNotReductionedState());
      }
      catch (e){
        emit(ReductionErrorState(e.toString()));
      }
    });
  }

  static Future<BaseReductionState> getInitialState(int productId) async {
    ExecuteResult<ReductionDetailWithStateModel> response = await AppHttpClient.execute(HttpMethod.get, '/Reduction/Get', {'productId': productId.toString()}, dataConstructor: ReductionDetailWithStateModel.fromJson);
    var event = response.single!;
    BaseReductionState initial;
    switch(event.state) {
      case ReductionState.sellerMadeReduction:
        initial = SellerProductReductionedState(event.reductionDetail!);
        break;
      case ReductionState.sellerUnmadeReduction:
        initial = SellerNotReductionedState();
        break;
      case ReductionState.buyerApplied:
        initial = BuyerReductionAppliedState(event.reductionDetail!);
        break;
      case ReductionState.buyerNotApplied:
        initial = BuyerReductionNotAppliedState(event.reductionDetail!);
        break;
      case ReductionState.buyerNotMadeReduction:
        initial = BuyerProductNotReductionedState();
        break;
      default:
        initial = ReductionErrorState("Something went wrong");
        break;
    }
    return initial;
  }
}