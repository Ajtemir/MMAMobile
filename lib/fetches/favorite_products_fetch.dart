import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:upai_app/views/auth/server/service.dart';

import '../model/productModel.dart';

Future<ListProductsModel> fetchProductsFavorite(String email) async {
  final response = await AuthClient().getProductsFavorite(email);

    return ListProductsModel.fromJson(jsonDecode(response));
}
