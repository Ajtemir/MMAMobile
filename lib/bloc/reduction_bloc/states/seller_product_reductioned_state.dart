import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/app_colors.dart';
import '../reduction_bloc.dart';
import '../reduction_detail_model.dart';
import '../reduction_event.dart';
import 'base_reduction_state.dart';

class SellerProductReductionedState extends BaseDetailReductionState {
  SellerProductReductionedState(ReductionDetailModel detail) : super(detail);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      detail.widget,
      detail.currentMinPrice == null
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
            BlocProvider.of<ReductionBloc>(context).add(ReductionSubmitEvent());
          },
          child: Text(
            "Подтвердить тендер",
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
            BlocProvider.of<ReductionBloc>(context).add(ReductionUnmakeEvent());
          },
          child: Text(
            "Отменить тендер",
          ),
        ),
      ),
    ],);
  }

}