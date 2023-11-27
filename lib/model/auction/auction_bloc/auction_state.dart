import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:upai_app/model/auction/auction_detail_model.dart';

import '../../../shared/app_colors.dart';
import '../../../views/category/aboutMagaz.dart';
import '../auction_state.dart';
import 'Events/base_auction_event.dart';
import 'auction_bloc.dart';

abstract class BaseBuildState extends Equatable {
  @override
  List<Object?> get props => [];
  Widget build(BuildContext context);
}
abstract class BaseAuctionState extends BaseBuildState{
}

abstract class BaseDetailAuctionState extends BaseAuctionState{
  final AuctionDetailModel detail;


  BaseDetailAuctionState(this.detail);
  @override
  List<Object?> get props => [detail];
}

class AuctionInitialState extends BaseDetailAuctionState {
  final AuctionState state;
  AuctionInitialState(AuctionDetailModel detail, this.state) : super(detail);

  @override
  Widget build(BuildContext context) {
      // TODO: implement build
      throw UnimplementedError();
  }



}
class SellerProductNotAuctionedState extends BaseAuctionState {
  @override
  Widget build(context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
              MaterialStatePropertyAll(AppColors.red1),
              padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 10)),
            ),
            onPressed: () {
              showMaterialModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20)),
                ),
                builder: (contextInner) =>
                    SingleChildScrollView(
                      controller: ModalScrollController.of(
                          contextInner),
                      child: MakeAuctionedForm()
                          .getWidget(context),
                    ),
              );
            },
            child: Text(
              "Запустить аукцион",
            ),
          ),
        ),
      ],
    );
  }
}

class SellerProductAuctionedState extends BaseDetailAuctionState {
  SellerProductAuctionedState(AuctionDetailModel detail) : super(detail);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      detail.widget,
      detail.currentMaxPrice == null
          ? const SizedBox()
          : SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
            MaterialStatePropertyAll(AppColors.red1),
            padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 10)),
          ),
          onPressed: () {
            BlocProvider.of<AuctionBloc>(context).add(AuctionSubmitEvent());
          },
          child: Text(
            "Подтвердить аукцион",
          ),
        ),
      ),
      SizedBox(height: 20,),
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
                true ? AppColors.red1 : AppColors.grey),
            padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 10)),
          ),
          onPressed: (){
            BlocProvider.of<AuctionBloc>(context).add(AuctionUnmadeEvent());
          },
          child: Text(
            "Отменить аукцион",
          ),
        ),
      ),
    ],);
  }

}

class BuyerAuctionAppliedState extends BaseDetailAuctionState {
  BuyerAuctionAppliedState(AuctionDetailModel detail) : super(detail);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    final _bloc = BlocProvider.of<AuctionBloc>(context);
    var state = this;
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          detail.widget,
          SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: 'suggestedPrice',
            validator: (valueCandidate) {
              if (valueCandidate?.isEmpty ?? true) {
                return 'This field is required.';
              }
              if(state.detail.currentMaxPrice != null && state.detail.currentMaxPrice! > double.parse(valueCandidate!)){
                return 'Suggested price must be more than current max price ${state.detail.currentMaxPrice}';
              }
              else if(double.parse(valueCandidate!) < state.detail.startPrice){
                return 'Suggested price must be more than start price ${state.detail.startPrice}';
              }
              return null;
            },
            enabled: true,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                labelText: 'Предложенная цена', border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(AppColors.red1),
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 10)),
              ),
              onPressed: () {
                if (_formKey.currentState!.saveAndValidate()) {
                  Map<String, dynamic> keyValuePairs = _formKey.currentState!.value;
                  var suggestedPrice = double.parse(keyValuePairs['suggestedPrice']);
                  _bloc.add(AuctionAppliedEvent(suggestedPrice));
                }

              },
              child: Text(
                "Повысить заявку на аукцион",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuyerAuctionNotAppliedState extends BaseDetailAuctionState {
  BuyerAuctionNotAppliedState(AuctionDetailModel detail) : super(detail);

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<AuctionBloc>(context);
    final state = this;
    final _formKey = GlobalKey<FormBuilderState>();
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          state.detail.widget,
          SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: 'suggestedPrice',
            validator: (valueCandidate) {
              if (valueCandidate?.isEmpty ?? true) {
                return 'This field is required.';
              }
              if(double.parse(valueCandidate!) < state.detail.startPrice){
                return 'Suggested price must be more than start price';
              }
              return null;
            },
            enabled: true,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                labelText: 'Предложенная цена', border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(AppColors.red1),
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 10)),
              ),
              onPressed: () {
                if (_formKey.currentState!.saveAndValidate()) {
                  Map<String, dynamic> keyValuePairs = _formKey.currentState!.value;
                  var suggestedPrice = double.parse(keyValuePairs['suggestedPrice']);
                  _bloc.add(AuctionAppliedEvent(suggestedPrice));
                }

              },
              child: Text(
                "Подать заявку на аукцион",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuyerProductNotAuctionedState extends BaseAuctionState {
  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class AuctionLoadingState extends BaseAuctionState {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: Colors.orange,));
  }
}

class AuctionErrorState extends BaseAuctionState {
  final String errorMessage;

  AuctionErrorState(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Text(errorMessage);
  }
}