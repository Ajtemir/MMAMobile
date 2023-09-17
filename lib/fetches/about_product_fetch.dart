import 'dart:convert';
import 'package:upai_app/service/service.dart';

import '../model/aboutProductModel.dart';

Future<AboutProductModel> fetchProductData(
    String productId, String email) async {
  final response = await AuthClient().getProductData(productId, email);

  return AboutProductModel.fromJson(jsonDecode(response));
}
