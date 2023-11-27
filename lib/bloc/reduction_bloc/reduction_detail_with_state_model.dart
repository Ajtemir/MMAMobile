import 'reduction_detail_model.dart';
import 'reduction_state_enum.dart';

class ReductionDetailWithStateModel{
  final ReductionDetailModel? reductionDetail;
  final ReductionState state;

  ReductionDetailWithStateModel(this.reductionDetail, this.state);


  ReductionDetailWithStateModel.fromJson(Map<String, dynamic> json) :
        reductionDetail = json['reductionDetail'] == null ? null : ReductionDetailModel.fromJson(json['reductionDetail']),
        state = ReductionState.values[json['reductionState']];
}