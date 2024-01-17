import 'package:equatable/equatable.dart';

abstract class BaseCreateProductEvent extends Equatable {
  const BaseCreateProductEvent();
  @override
  List<Object?> get props => [];
}

class ChooseCategoryEvent extends BaseCreateProductEvent{
  final int categoryId;

  const ChooseCategoryEvent(this.categoryId);
}