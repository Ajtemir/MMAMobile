import 'package:flutter/src/widgets/framework.dart';
import 'package:upai_app/bloc/create_product_bloc/base_create_product_state.dart';
import 'package:upai_app/views/drawer/hotKeshAdd.dart';

class CreateProductInitialState extends BaseCreateProductState{
  @override
  Widget build(BuildContext context) {
    return HotKeshAdd();
  }

}