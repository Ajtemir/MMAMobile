import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:upai_app/views/auth/server/service.dart';

import '../Service/base_client.dart';
import '../model/aboutProductModel.dart';
import '../model/productModel.dart';

Future<AboutProductModel> fetchProductData(String productId,String email) async {
  final response = await AuthClient().getProductData(productId,email);

  return AboutProductModel.fromJson(jsonDecode(response));
}
