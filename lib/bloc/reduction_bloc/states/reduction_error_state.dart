import 'package:flutter/material.dart';
import 'base_reduction_state.dart';

class ReductionErrorState extends BaseReductionState {
  final String errorMessage;

  ReductionErrorState(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Text(errorMessage);
  }
}