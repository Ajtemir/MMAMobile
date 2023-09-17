import 'dart:convert';
import 'package:upai_app/service/service.dart';
import '../model/productModel.dart';

Future<ListProductsModel> fetchProducts() async {
  final response = await AuthClient().getProducts();

  return ListProductsModel.fromJson(jsonDecode(response));
}
