import 'dart:convert';
import 'package:upai_app/service/service.dart';
import '../model/productModel.dart';

Future<ListProductsModel> fetchProfileProducts(String email) async {
  final response = await AuthClient().getProfileProducts(email);

  return ListProductsModel.fromJson(jsonDecode(response));
}
