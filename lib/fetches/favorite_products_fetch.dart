import 'dart:convert';
import 'package:upai_app/service/service.dart';
import '../model/productModel.dart';

Future<ListProductsModel> fetchProductsFavorite(String email) async {
  final response = await AuthClient().getProductsFavorite(email);

  return ListProductsModel.fromJson(jsonDecode(response));
}
