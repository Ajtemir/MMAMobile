import 'package:flutter/material.dart';

import 'base_reduction_state.dart';

class ReductionLoadingState extends BaseReductionState {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: Colors.orange,));
  }
}