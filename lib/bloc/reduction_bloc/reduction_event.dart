import 'package:equatable/equatable.dart';

import 'reduction_detail_model.dart';
import 'reduction_state_enum.dart';

abstract class BaseReductionEvent extends Equatable {
  const BaseReductionEvent();
  @override
  List<Object?> get props => [];
}

abstract class BaseDetailReductionEvent extends BaseReductionEvent {
  final ReductionDetailModel detail;

  const BaseDetailReductionEvent(this.detail);
}

abstract class BaseMakingReductionEvent extends BaseReductionEvent {
  final int productId;
  final String email;
  const BaseMakingReductionEvent(this.productId, this.email);
  @override
  List<Object?> get props => [productId, email];
}

abstract class BaseDetailMakingReductionEvent extends BaseMakingReductionEvent {
  final ReductionDetailModel detail;
  const BaseDetailMakingReductionEvent(int productId, String email, this.detail) : super(productId, email);

}

class InitialRenderingReductionEvent extends BaseReductionEvent {
  final ReductionDetailModel? detail;
  final ReductionState state;

  const InitialRenderingReductionEvent(this.detail, this.state);
}

class ReductionMakeEvent extends BaseDetailReductionEvent {
  const ReductionMakeEvent(ReductionDetailModel detail) : super(detail);
}
class ReductionUnmakeEvent extends BaseReductionEvent {
}
class InitReductionEvent extends BaseReductionEvent {
}
class ReductionApplyEvent extends BaseReductionEvent {
  final double suggestedPrice;
  const ReductionApplyEvent(this.suggestedPrice);
}
class ReductionDenyEvent extends BaseReductionEvent {}
class ReductionSubmitEvent extends BaseReductionEvent {}