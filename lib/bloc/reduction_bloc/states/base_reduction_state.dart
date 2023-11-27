import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../model/auction/auction_bloc/auction_state.dart';
import '../../../shared/app_colors.dart';
import '../../../views/category/aboutMagaz.dart';
import '../reduction_bloc.dart';
import '../reduction_detail_model.dart';
import '../reduction_event.dart';

abstract class BaseReductionState extends BaseBuildState{
}

abstract class BaseDetailReductionState extends BaseReductionState{
  final ReductionDetailModel detail;

  BaseDetailReductionState(this.detail);
  @override
  List<Object?> get props => [detail];
}












