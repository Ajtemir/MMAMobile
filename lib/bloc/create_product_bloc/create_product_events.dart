import 'package:equatable/equatable.dart';

abstract class BaseCreateProductEvent extends Equatable {
  const BaseCreateProductEvent();
  @override
  List<Object?> get props => [];
}

class ChooseCategoryEvent extends BaseCreateProductEvent{
  final int categoryId;
  final int productId;

  const ChooseCategoryEvent(this.categoryId, this.productId);
}