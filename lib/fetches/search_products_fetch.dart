import 'dart:convert';
import 'package:upai_app/service/service.dart';
import '../model/productModel.dart';

Future<ListProductsModel> fetchSearchProducts(String search) async {
  final response = await AuthClient().getSearchProducts(search);

  return ListProductsModel.fromJson(jsonDecode(response));
}
