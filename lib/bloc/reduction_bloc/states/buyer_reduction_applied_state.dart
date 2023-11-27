import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../shared/app_colors.dart';
import '../reduction_bloc.dart';
import '../reduction_detail_model.dart';
import '../reduction_event.dart';
import 'base_reduction_state.dart';

class BuyerReductionAppliedState extends BaseDetailReductionState {
  BuyerReductionAppliedState(ReductionDetailModel detail) : super(detail);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    final _bloc = BlocProvider.of<ReductionBloc>(context);
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
              if(state.detail.currentMinPrice != null && state.detail.currentMinPrice! < double.parse(valueCandidate!)){
                return 'Suggested price must be less than current min price ${state.detail.currentMinPrice}';
              }
              else if(double.parse(valueCandidate!) > state.detail.startPrice){
                return 'Suggested price must be less than start price ${state.detail.startPrice}';
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
                  _bloc.add(ReductionApplyEvent(suggestedPrice));
                }

              },
              child: Text(
                "Понизить заявку на тендер",
              ),
            ),
          ),
        ],
      ),
    );
  }
}