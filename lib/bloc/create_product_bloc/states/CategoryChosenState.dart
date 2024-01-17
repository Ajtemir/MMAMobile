import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:upai_app/bloc/create_product_bloc/base_create_product_state.dart';

class CategoryChosenState extends BaseCreateProductState{
  final int categoryId;

  CategoryChosenState(this.categoryId);
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(categoryId.toString(),),);
  }
}