import 'dart:convert';

import 'package:upai_app/service/service.dart';
import '../model/productModel.dart';

Future<ListProductsModel> fetchCategoryProducts(String id) async {
  final response = await AuthClient().getCategoryProducts(id);

  return ListProductsModel.fromJson(jsonDecode(response));
}
