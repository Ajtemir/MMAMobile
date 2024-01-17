import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upai_app/bloc/create_product_bloc/create_product_events.dart';
import 'package:upai_app/bloc/create_product_bloc/states/CategoryChosenState.dart';
import 'package:upai_app/bloc/create_product_bloc/states/CreateProductInitialState.dart';

import 'base_create_product_state.dart';

class CreateProductBloc extends Bloc<BaseCreateProductEvent, BaseCreateProductState> {
  late int categoryId;
  CreateProductBloc() : super(CreateProductInitialState()) {
    on<ChooseCategoryEvent>((event, emit) {
      categoryId = event.categoryId;
      emit(CategoryChosenState(event.categoryId));
    });
  }

}