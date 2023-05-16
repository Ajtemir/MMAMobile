import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:upai_app/views/auth/server/service.dart';

import '../Service/base_client.dart';
import '../model/productModel.dart';

Future<ListProductsModel> fetchProfileProducts(String email) async {
  final response = await AuthClient().getProfileProducts(email);

    return ListProductsModel.fromJson(jsonDecode(response));
}
